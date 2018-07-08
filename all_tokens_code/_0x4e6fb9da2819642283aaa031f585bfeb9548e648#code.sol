//token_name	
//token_url	https://etherscan.io//address/0x4e6fb9da2819642283aaa031f585bfeb9548e648#code
//spider_time	2018/07/08 11:05:44
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.18;

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