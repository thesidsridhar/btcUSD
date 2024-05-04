// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "../../interfaces/IAaveLendingPool.sol"; //import these contracts
import "../../interfaces/IAaveIncentivesController.sol"; //import these contracts
import "../../dependencies/BBLOwnable.sol";

/**
    @title BBL Aave Deposit Token
    @notice This contract manages the deposit of ERC20 tokens into Aave Lending Pool,
            where tokens are minted on deposits and burned when withdrawn. Holders may
            also accrue interest and claim AAVE rewards.
 */
contract AaveDepositToken {
    IERC20 public immutable underlyingToken;
    IAaveLendingPool public immutable aaveLendingPool;
    IAaveIncentivesController public immutable incentivesController;

    string public symbol;
    string public name;
    uint256 public constant decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Deposited(address indexed from, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);
    event RewardClaimed(address indexed receiver, uint256 rewardAmount);

    constructor(IERC20 _underlyingToken, IAaveLendingPool _aaveLendingPool, IAaveIncentivesController _incentivesController) {
        underlyingToken = _underlyingToken;
        aaveLendingPool = _aaveLendingPool;
        incentivesController = _incentivesController;

        string memory _symbol = IERC20Metadata(address(_underlyingToken)).symbol();
        name = string.concat("BBL ", _symbol, " Aave Deposit");
        symbol = string.concat("BBL-", _symbol);

        _underlyingToken.approve(address(_aaveLendingPool), type(uint256).max);
    }

    function deposit(address from, uint256 amount) external returns (bool) {
        require(amount > 0, "Cannot deposit zero");
        underlyingToken.transferFrom(from, address(this), amount);
        aaveLendingPool.deposit(address(underlyingToken), amount, address(this), 0);

        uint256 balance = balanceOf[from];
        balanceOf[from] = balance + amount;
        totalSupply += amount;

        emit Transfer(address(0), from, amount);
        emit Deposited(from, amount);
        return true;
    }

    function withdraw(address to, uint256 amount) external returns (bool) {
        require(amount > 0, "Cannot withdraw zero");
        uint256 balance = balanceOf[msg.sender];
        require(balance >= amount, "Insufficient balance");

        aaveLendingPool.withdraw(address(underlyingToken), amount, to);
        balanceOf[msg.sender] = balance - amount;
        totalSupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
        emit Withdrawn(to, amount);
        return true;
    }

    function claimReward() external {
        uint256 reward = incentivesController.claimRewards(
            new address[](1, address(this)),
            uint256.max,
            msg.sender
        );

        emit RewardClaimed(msg.sender, reward);
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transfer(address to, uint256 value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        uint256 allowed = allowance[from][msg.sender];
        require(allowed >= value, "Allowance exceeded");
        if (allowed != type(uint256).max) {
            allowance[from][msg.sender] -= value;
        }
        _transfer(from, to, value);
        return true;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(balanceOf[from] >= value, "Insufficient balance");
        require(from != address(0) && to != address(0), "Invalid addresses");

        balanceOf[from] -= value;
        balanceOf[to] += value;

        emit Transfer(from, to, value);
    }
}
