// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "../interfaces/IBBLCore.sol";

/**
    @title BBL Ownable
    @notice Contracts inheriting `BBLOwnable` have the same owner as `BBLCore`.
            The ownership cannot be independently modified or renounced.
 */
contract BBLOwnable {
    IBBLCore public immutable BBL_CORE;

    constructor(address _BBLCore) {
        BBL_CORE = IBBLCore(_BBLCore);
    }

    modifier onlyOwner() {
        require(msg.sender == BBL_CORE.owner(), "Only owner");
        _;
    }

    function owner() public view returns (address) {
        return BBL_CORE.owner();
    }

    function guardian() public view returns (address) {
        return BBL_CORE.guardian();
    }
}
