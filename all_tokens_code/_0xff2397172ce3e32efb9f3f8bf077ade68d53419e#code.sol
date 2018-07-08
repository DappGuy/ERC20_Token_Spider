//token_name	
//token_url	https://etherscan.io//address/0xff2397172ce3e32efb9f3f8bf077ade68d53419e#code
//spider_time	2018/07/08 11:40:16
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.23;

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