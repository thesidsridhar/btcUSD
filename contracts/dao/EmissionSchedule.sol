// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "../interfaces/IIncentiveVoting.sol";
import "../interfaces/IVault.sol";
import "../dependencies/BBLOwnable.sol";
import "../dependencies/SystemStart.sol";

/**
    @title BBL Emission Schedule
    @notice Calculates weekly BBL emissions. The weekly amount is determined
            as a percentage of the remaining unallocated supply. Over time the
            reward rate will decay to dust as it approaches the maximum supply,
            but should not reach zero for a Very Long Time.
 */
contract EmissionSchedule is BBLOwnable, SystemStart {
    event WeeklyPctScheduleSet(uint64[2][] schedule);
    event LockParametersSet(uint256 lockWeeks, uint256 lockDecayWeeks);

    // number representing 100% in `weeklyPct`
    uint256 constant MAX_PCT = 10000;
    uint256 public constant MAX_LOCK_WEEKS = 52;

    IIncentiveVoting public immutable voter;
    IBBLVault public immutable vault;

    // current number of weeks that emissions are locked for when they are claimed
    uint64 public lockWeeks;
    // every `lockDecayWeeks`, the number of lock weeks is decreased by one
    uint64 public lockDecayWeeks;

    // percentage of the unallocated BBL supply given as emissions in a week
    uint64 public weeklyPct;

    // [(week, weeklyPct)... ] ordered by week descending
    // schedule of changes to `weeklyPct` to be applied in future weeks
    uint64[2][] private scheduledWeeklyPct;

    constructor(
        address _BBLCore,
        IIncentiveVoting _voter,
        IBBLVault _vault,
        uint64 _initialLockWeeks,
        uint64 _lockDecayWeeks,
        uint64 _weeklyPct,
        uint64[2][] memory _scheduledWeeklyPct
    ) BBLOwnable(_BBLCore) SystemStart(_BBLCore) {
        voter = _voter;
        vault = _vault;

        lockWeeks = _initialLockWeeks;
        lockDecayWeeks = _lockDecayWeeks;
        weeklyPct = _weeklyPct;
        _setWeeklyPctSchedule(_scheduledWeeklyPct);
        emit LockParametersSet(_initialLockWeeks, _lockDecayWeeks);
    }

    function getWeeklyPctSchedule() external view returns (uint64[2][] memory) {
        return scheduledWeeklyPct;
    }

    /**
        @notice Set a schedule for future updates to `weeklyPct`
        @dev The given schedule replaces any existing one
        @param _schedule Dynamic array of (week, weeklyPct) ordered by week descending.
                         Each `week` indicates the number of weeks after the current week.
     */
    function setWeeklyPctSchedule(uint64[2][] memory _schedule) external onlyOwner returns (bool) {
        _setWeeklyPctSchedule(_schedule);
        return true;
    }

    /**
        @notice Set the number of lock weeks and rate at which lock weeks decay
     */
    function setLockParameters(uint64 _lockWeeks, uint64 _lockDecayWeeks) external onlyOwner returns (bool) {
        require(_lockWeeks <= MAX_LOCK_WEEKS, "Cannot exceed MAX_LOCK_WEEKS");
        require(_lockDecayWeeks > 0, "Decay weeks cannot be 0");

        lockWeeks = _lockWeeks;
        lockDecayWeeks = _lockDecayWeeks;
        emit LockParametersSet(_lockWeeks, _lockDecayWeeks);
        return true;
    }

    function getReceiverWeeklyEmissions(
        uint256 id,
        uint256 week,
        uint256 totalWeeklyEmissions
    ) external returns (uint256) {
        uint256 pct = voter.getReceiverVotePct(id, week);

        return (totalWeeklyEmissions * pct) / 1e18;
    }

    function getTotalWeeklyEmissions(
        uint256 week,
        uint256 unallocatedTotal
    ) external returns (uint256 amount, uint256 lock) {
        require(msg.sender == address(vault));

        // apply the lock week decay
        lock = lockWeeks;
        if (lock > 0 && week % lockDecayWeeks == 0) {
            lock -= 1;
            lockWeeks = uint64(lock);
        }

        // check for and apply scheduled update to `weeklyPct`
        uint256 length = scheduledWeeklyPct.length;
        uint256 pct = weeklyPct;
        if (length > 0) {
            uint64[2] memory nextUpdate = scheduledWeeklyPct[length - 1];
            if (nextUpdate[0] == week) {
                scheduledWeeklyPct.pop();
                pct = nextUpdate[1];
                weeklyPct = nextUpdate[1];
            }
        }

        // calculate the weekly emissions as a percentage of the unallocated supply
        amount = (unallocatedTotal * pct) / MAX_PCT;

        return (amount, lock);
    }

    function _setWeeklyPctSchedule(uint64[2][] memory _scheduledWeeklyPct) internal {
        uint256 length = _scheduledWeeklyPct.length;
        if (length > 0) {
            uint256 week = _scheduledWeeklyPct[0][0];
            uint256 currentWeek = getWeek();
            for (uint256 i = 0; i < length; i++) {
                if (i > 0) {
                    require(_scheduledWeeklyPct[i][0] < week, "Must sort by week descending");
                    week = _scheduledWeeklyPct[i][0];
                }
                _scheduledWeeklyPct[i][0] = uint64(week + currentWeek);
                require(_scheduledWeeklyPct[i][1] <= MAX_PCT, "Cannot exceed MAX_PCT");
            }
            require(week > 0, "Cannot schedule past weeks");
        }
        scheduledWeeklyPct = _scheduledWeeklyPct;
        emit WeeklyPctScheduleSet(_scheduledWeeklyPct);
    }
}
