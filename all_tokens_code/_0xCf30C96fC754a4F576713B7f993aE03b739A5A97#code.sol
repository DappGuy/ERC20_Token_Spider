//token_name	
//token_url	https://etherscan.io//address/0xCf30C96fC754a4F576713B7f993aE03b739A5A97#code
//spider_time	2018/07/08 12:25:08
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.6;


library SafeMathLibExt {

  function times(uint a, uint b) returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function divides(uint a, uint b) returns (uint) {
    assert(b > 0);
    uint c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

  function minus(uint a, uint b) returns (uint) {
    assert(b <= a);
    return a - b;
  }

  function plus(uint a, uint b) returns (uint) {
    uint c = a + b;
    assert(c>=a);
    return c;
  }

}