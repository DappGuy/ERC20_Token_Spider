//token_name	
//token_url	https://etherscan.io//address/0xc2c58a79db674f8f75190e0f1e18f3c8ea7d4554#code
//spider_time	2018/07/08 11:13:38
//token_Transactions	22 txns
//token_price	

pragma solidity ^0.4.15;

// File: contracts/Migrations.sol

contract Migrations {
  address public owner;
  uint256 public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner)
      _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) restricted public {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) restricted public {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}