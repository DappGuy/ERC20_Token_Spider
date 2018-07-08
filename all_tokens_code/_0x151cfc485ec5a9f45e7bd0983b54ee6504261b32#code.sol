//token_name	
//token_url	https://etherscan.io//address/0x151cfc485ec5a9f45e7bd0983b54ee6504261b32#code
//spider_time	2018/07/08 12:07:14
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.20;

/*
* Simply returns keccak256 of your eth address
*/

contract kektest {
  
  
  
  function kek(address) public view returns(bytes32) {
      
      address _ethaddy = msg.sender;
        return (keccak256(_ethaddy));
  }  
    
}