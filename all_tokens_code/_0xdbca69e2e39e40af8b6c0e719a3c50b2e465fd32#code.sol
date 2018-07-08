//token_name	
//token_url	https://etherscan.io//address/0xdbca69e2e39e40af8b6c0e719a3c50b2e465fd32#code
//spider_time	2018/07/08 12:07:52
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.4;

// File: contracts/Migrations.sol

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public {
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