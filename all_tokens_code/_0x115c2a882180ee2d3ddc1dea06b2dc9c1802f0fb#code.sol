//token_name	
//token_url	https://etherscan.io//address/0x115c2a882180ee2d3ddc1dea06b2dc9c1802f0fb#code
//spider_time	2018/07/08 12:15:54
//token_Transactions	1 txn
//token_price	

contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract AirdropEth {
  function drop(address[] recipients, uint256[] values) payable public {
    for (uint256 i = 0; i < recipients.length; i++) {
      recipients[i].transfer(values[i]);
    }
  }
}