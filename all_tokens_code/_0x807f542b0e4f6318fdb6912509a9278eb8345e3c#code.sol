//token_name	
//token_url	https://etherscan.io//address/0x807f542b0e4f6318fdb6912509a9278eb8345e3c#code
//spider_time	2018/07/08 11:33:33
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.17;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
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