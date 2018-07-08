//token_name	
//token_url	https://etherscan.io//address/0x101f0b1dfc2c6cac45d4b6c36adf96d67b84fe24#code
//spider_time	2018/07/08 12:31:49
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.17;


contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) {
      _;
    }
  }

  function Migrations() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address newAddress) public restricted {
    Migrations upgraded = Migrations(newAddress);
    upgraded.setCompleted(last_completed_migration);
  }
}