//token_name	
//token_url	https://etherscan.io//address/0xc14cba2154f06c65a0c488dd234009f790fe9247#code
//spider_time	2018/07/08 12:11:41
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.17;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}