//token_name	
//token_url	https://etherscan.io//address/0x631b905bca1114ab736e270c1f02a0555130cc5e#code
//spider_time	2018/07/08 11:51:22
//token_Transactions	11 txns
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

// set completed butts
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}