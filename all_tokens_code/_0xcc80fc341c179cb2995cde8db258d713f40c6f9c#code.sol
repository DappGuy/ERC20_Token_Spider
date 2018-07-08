//token_name	
//token_url	https://etherscan.io//address/0xcc80fc341c179cb2995cde8db258d713f40c6f9c#code
//spider_time	2018/07/08 11:24:56
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.18;

contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract Mengudara {
  function drop(ERC20 token, address[] recipients, uint256[] values) public {
    for (uint256 i = 0; i < recipients.length; i++) {
      token.transfer(recipients[i], values[i]);
    }
  }
}