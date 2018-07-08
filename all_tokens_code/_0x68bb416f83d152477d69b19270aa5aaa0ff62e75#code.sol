//token_name	
//token_url	https://etherscan.io//address/0x68bb416f83d152477d69b19270aa5aaa0ff62e75#code
//spider_time	2018/07/08 11:10:24
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.22;

contract WETH {
  mapping (address => uint256) balances;

  constructor() public {
    // balances[msg.sender] = 10000;
  }

  function transfer(address to, uint256 amount) public {
    require(amount <= balances[msg.sender]);
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  function mint() payable public {
    balances[msg.sender] += msg.value;
  }

  function burn(uint256 amount) public {
    require(amount <= balances[msg.sender]);
    balances[msg.sender] -= amount;
    msg.sender.transfer(amount);
  }
}