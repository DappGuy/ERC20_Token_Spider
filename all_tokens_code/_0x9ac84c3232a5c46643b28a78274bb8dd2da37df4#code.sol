//token_name	
//token_url	https://etherscan.io//address/0x9ac84c3232a5c46643b28a78274bb8dd2da37df4#code
//spider_time	2018/07/08 11:08:40
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.4;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public{
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