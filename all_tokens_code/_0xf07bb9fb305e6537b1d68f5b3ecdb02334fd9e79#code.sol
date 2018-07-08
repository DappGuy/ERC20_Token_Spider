//token_name	
//token_url	https://etherscan.io//address/0xf07bb9fb305e6537b1d68f5b3ecdb02334fd9e79#code
//spider_time	2018/07/08 11:30:18
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.21;

contract Migrations {
  address public owner;
  uint256 public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() public {
    owner = msg.sender;
  }

  function setCompleted(uint256 completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}