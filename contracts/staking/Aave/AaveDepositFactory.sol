// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "../../dependencies/BBLOwnable.sol";

interface IAaveDepositToken {
    function initialize(IERC20 _underlyingToken, IAaveLendingPool _aaveLendingPool, IAaveIncentivesController _incentivesController) external;
}

/**
    @notice BBL Aave Factory
    @title Deploys clones of `AaveDepositToken` as directed by the BBL DAO
 */
contract AaveDepositFactory is BBLOwnable {
    using Clones for address;

    address public depositTokenImpl;

    // Tracking Aave deposit token deployments by underlying token addresses
    mapping(address => address) public getDepositToken;

    event NewDeployment(address depositToken, address underlyingToken);
    event ImplementationSet(address depositTokenImpl);

    constructor(
        address _BBLCore,
        address _depositTokenImpl,
        address[] memory _existingDeployments,
        address[] memory _underlyingTokens
    ) BBLOwnable(_BBLCore) {
        depositTokenImpl = _depositTokenImpl;
        emit ImplementationSet(_depositTokenImpl);

        for (uint i = 0; i < _existingDeployments.length; i++) {
            address depositToken = _existingDeployments[i];
            address underlyingToken = _underlyingTokens[i];
            getDepositToken[underlyingToken] = depositToken;
            emit NewDeployment(depositToken, underlyingToken);
        }
    }

    /**
        @dev After calling this function, the owner should also configure Aave incentives
             for the newly deployed `AaveDepositToken`.
        @param _underlyingToken The ERC20 token to be deposited in the Aave Lending Pool.
        @param _aaveLendingPool Address of the Aave Lending Pool.
        @param _incentivesController Address of the Aave Incentives Controller.
     */
    function deployNewInstance(
        IERC20 _underlyingToken,
        IAaveLendingPool _aaveLendingPool,
        IAaveIncentivesController _incentivesController
    ) external onlyOwner {
        require(address(getDepositToken[address(_underlyingToken)]) == address(0), "Token already has a deployment");

        address depositToken = depositTokenImpl.clone();
        IAaveDepositToken(depositToken).initialize(_underlyingToken, _aaveLendingPool, _incentivesController);
        getDepositToken[address(_underlyingToken)] = depositToken;

        emit NewDeployment(depositToken, address(_underlyingToken));
    }

    function setImplementation(address impl) external onlyOwner {
        depositTokenImpl = impl;
        emit ImplementationSet(impl);
    }
}
