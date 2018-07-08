//token_name	
//token_url	https://etherscan.io//address/0x3c4f0c6dc28c210132bb19979e66de0dca98595a#code
//spider_time	2018/07/08 12:23:04
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.19;

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