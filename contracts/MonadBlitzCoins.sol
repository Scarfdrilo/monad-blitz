// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MonadBlitzCoins {
    string public name = "Blitz Coins";
    string public symbol = "BLTZ";
    uint8 public decimals = 18;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;
    mapping(address => uint256) public lastClaim;

    uint256 public constant CLAIM_COOLDOWN = 60; // 60 seconds between claims
    uint256 public constant MAX_CLAIM = 1000 * 1e18; // max 1000 BLTZ per claim

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event ClaimReward(address indexed player, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Players can claim their own rewards (with cooldown)
    function claimReward(uint256 amount) external {
        require(amount > 0 && amount <= MAX_CLAIM, "Invalid amount");
        require(block.timestamp >= lastClaim[msg.sender] + CLAIM_COOLDOWN, "Cooldown active");
        lastClaim[msg.sender] = block.timestamp;
        balances[msg.sender] += amount;
        totalSupply += amount;
        emit ClaimReward(msg.sender, amount);
        emit Transfer(address(0), msg.sender, amount);
    }

    /// @notice Owner can mint to any address
    function mintTo(address player, uint256 amount) external onlyOwner {
        balances[player] += amount;
        totalSupply += amount;
        emit Transfer(address(0), player, amount);
    }

    function getBalance(address account) external view returns (uint256) {
        return balances[account];
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address _owner, address spender) external view returns (uint256) {
        return allowances[_owner][spender];
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        require(balances[from] >= amount, "Insufficient balance");
        require(allowances[from][msg.sender] >= amount, "Insufficient allowance");
        allowances[from][msg.sender] -= amount;
        balances[from] -= amount;
        balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }
}
