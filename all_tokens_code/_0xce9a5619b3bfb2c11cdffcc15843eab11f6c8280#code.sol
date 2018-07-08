//token_name	
//token_url	https://etherscan.io//address/0xce9a5619b3bfb2c11cdffcc15843eab11f6c8280#code
//spider_time	2018/07/08 12:01:20
//token_Transactions	2 txns
//token_price	

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