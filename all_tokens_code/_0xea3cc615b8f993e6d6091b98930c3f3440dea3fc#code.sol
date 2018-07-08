//token_name	
//token_url	https://etherscan.io//address/0xea3cc615b8f993e6d6091b98930c3f3440dea3fc#code
//spider_time	2018/07/08 12:33:55
//token_Transactions	114 txns
//token_price	

pragma solidity ^0.4.19;

contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract Airdrop {
  function drop(ERC20 token, address[] recipients, uint256[] values) public {
    for (uint256 i = 0; i < recipients.length; i++) {
      token.transfer(recipients[i], values[i]);
    }
  }
}