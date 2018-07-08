//token_name	
//token_url	https://etherscan.io//address/0xb65f0c7babc0e0dc05294d7ec703788f9ad2b52a#code
//spider_time	2018/07/08 11:05:51
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.24;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  constructor() public {
    owner = msg.sender;
  }

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}