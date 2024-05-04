// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "../../dependencies/BBLOwnable.sol";

interface ILiquityDepositToken {
    function initialize(IERC20 _lusdToken, IStabilityPool _stabilityPool, ILQTYStaking _lqtyStaking) external;
}

/**
    @notice BBL Liquity Factory
    @title Deploys clones of `LiquityDepositToken` as directed by the BBL DAO
 */
contract LiquityDepositFactory is BBLOwnable {
    using Clones for address;

    address public depositTokenImpl;

    // Tracking Liquity deposit token deployments by stability pool addresses
    mapping(address => address) public getDepositToken;

    event NewDeployment(address depositToken, address stabilityPool);
    event ImplementationSet(address depositTokenImpl);

    constructor(
        address _BBLCore,
        address _depositTokenImpl,
        address[] memory _existingDeployments,
        address[] memory _stabilityPools
    ) BBLOwnable(_BBLCore) {
        depositTokenImpl = _depositTokenImpl;
        emit ImplementationSet(_depositTokenImpl);

        for (uint i = 0; i < _existingDeployments.length; i++) {
            address depositToken = _existingDeployments[i];
            address stabilityPool = _stabilityPools[i];
            getDepositToken[stabilityPool] = depositToken;
            emit NewDeployment(depositToken, stabilityPool);
        }
    }

    /**
        @dev After calling this function, the owner should also configure any necessary parameters
             for LQTY staking or other rewards mechanisms in Liquity.
        @param _lusdToken The LUSD token used in the Stability Pool.
        @param _stabilityPool Address of the Stability Pool.
        @param _lqtyStaking Address of the LQTY Staking contract.
     */
    function deployNewInstance(
        IERC20 _lusdToken,
        IStabilityPool _stabilityPool,
        ILQTYStaking _lqtyStaking
    ) external onlyOwner {
        require(address(getDepositToken[address(_stabilityPool)]) == address(0), "Stability Pool already has a deployment");

        address depositToken = depositTokenImpl.clone();
        ILiquityDepositToken(depositToken).initialize(_lusdToken, _stabilityPool, _lqtyStaking);
        getDepositToken[address(_stabilityPool)] = depositToken;

        emit NewDeployment(depositToken, address(_stabilityPool));
    }

    function setImplementation(address impl) external onlyOwner {
        depositTokenImpl = impl;
        emit ImplementationSet(impl);
    }
}
