// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "../interfaces/IBBLCore.sol";

/**
    @title BBL System Start Time
    @dev Provides a unified `startTime` and `getWeek`, used for emissions.
 */
contract SystemStart {
    uint256 immutable startTime;

    constructor(address BBLCore) {
        startTime = IBBLCore(BBLCore).startTime();
    }

    function getWeek() public view returns (uint256 week) {
        return (block.timestamp - startTime) / 1 weeks;
    }
}
