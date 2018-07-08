//token_name	
//token_url	https://etherscan.io//address/0xb9a008833c1cb31e23493bc2d8a086a5fd0bf398#code
//spider_time	2018/07/08 11:36:28
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