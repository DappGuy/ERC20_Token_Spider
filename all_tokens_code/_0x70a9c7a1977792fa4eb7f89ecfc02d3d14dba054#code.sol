//token_name	
//token_url	https://etherscan.io//address/0x70a9c7a1977792fa4eb7f89ecfc02d3d14dba054#code
//spider_time	2018/07/08 11:28:44
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.18;

contract DAppTest {

  bool public _is;

  function changeBoolean() public returns (bool success) {
    _is = !_is;
    return true;
  }

}