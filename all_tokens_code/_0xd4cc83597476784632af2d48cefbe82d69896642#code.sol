//token_name	
//token_url	https://etherscan.io//address/0xd4cc83597476784632af2d48cefbe82d69896642#code
//spider_time	2018/07/08 12:32:51
//token_Transactions	12 txns
//token_price	

pragma solidity ^0.4.17;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }
//butts
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