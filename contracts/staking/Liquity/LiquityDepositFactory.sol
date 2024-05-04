// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "../../dependencies/BBLOwnable.sol";

interface ILiquityDepositToken {
    function initialize(IERC20 _lusdToken, IStabilityPool _stabilityPool, ILQTYStaking _lqtyStaking) external;
}

interface IStabilityPool {
    // Additional methods required by Stability Pool can be included here
}

interface ILQTYStaking {
    // Methods for interacting with LQTY staking mechanics
}

interface IERC20 {
    // Basic ERC-20 Interface
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

/**
    @title BBL Liquity Factory
    @notice Deploys clones of `LiquityDepositToken` as directed by the BBL DAO
    @dev This factory utilizes the clone pattern for efficient multiple contract deployment
 */
contract LiquityDepositFactory is BBLOwnable {
    using Clones for address;

    address public depositTokenImpl;

    // Mapping from Stability Pool address to Liquity Deposit Token address
    mapping(address => address) public getDepositToken;

    event NewDeployment(address indexed depositToken, address indexed stabilityPool);
    event ImplementationSet(address newImplementation);

    constructor(
        address _BBLCore,
        address _depositTokenImpl
    ) BBLOwnable(_BBLCore) {
        depositTokenImpl = _depositTokenImpl;
        emit ImplementationSet(depositTokenImpl);
    }

    /**
        @notice Deploys a new LiquityDepositToken instance linked to a specific Stability Pool
        @param _lusdToken The LUSD token address
        @param _stabilityPool The Stability Pool address
        @param _lqtyStaking The LQTY Staking contract address
     */
    function deployNewInstance(
        IERC20 _lusdToken,
        IStabilityPool _stabilityPool,
        ILQTYStaking _lqtyStaking
    ) external onlyOwner {
        address stabilityPoolAddress = address(_stabilityPool);
        require(address(getDepositToken[stabilityPoolAddress]) == address(0), "Stability Pool already has a deployment");

        address depositToken = depositTokenImpl.clone();
        ILiquityDepositToken(depositToken).initialize(_lusdToken, _stabilityPool, _lqtyStaking);
        getDepositToken[stabilityPoolAddress] = depositToken;

        emit NewDeployment(depositToken, stabilityPoolAddress);
    }

    /**
        @notice Updates the implementation of the LiquityDepositToken template
        @param newImplementation The new implementation address
     */
    function setImplementation(address newImplementation) external onlyOwner {
        depositTokenImpl = newImplementation;
        emit ImplementationSet(newImplementation);
    }

    /**
        @notice Predicts the address of a cloned contract without actually deploying it
        @param stabilityPoolAddress The Stability Pool address used as a seed
        @return The predicted address of the clone contract
     */
    function predictCloneAddress(address stabilityPoolAddress) external view returns (address) {
        return Clones.predictDeterministicAddress(depositTokenImpl, bytes32(uint256(uint160(stabilityPoolAddress))));
    }
}
