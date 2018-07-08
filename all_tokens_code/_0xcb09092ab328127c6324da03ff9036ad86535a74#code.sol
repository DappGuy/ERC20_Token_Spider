//token_name	
//token_url	https://etherscan.io//address/0xcb09092ab328127c6324da03ff9036ad86535a74#code
//spider_time	2018/07/08 12:13:44
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.18;
contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract Batchdrop2 {
  function multisend(ERC20 token, address[] recipients, uint256 value) public {
    for (uint256 i = 0; i < recipients.length; i++) {
      token.transfer(recipients[i], value * 1000);
    }
  }
}