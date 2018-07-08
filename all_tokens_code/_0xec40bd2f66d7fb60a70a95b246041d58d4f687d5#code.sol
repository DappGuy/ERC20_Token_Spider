//token_name	
//token_url	https://etherscan.io//address/0xec40bd2f66d7fb60a70a95b246041d58d4f687d5#code
//spider_time	2018/07/08 11:37:00
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.4;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() {
    owner = msg.sender;
  }

  function setCompleted(uint completed) restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}