//token_name	
//token_url	https://etherscan.io//address/0xc9e1bfc91312927fb10e76d6af671ea11c828815#code
//spider_time	2018/07/08 11:15:13
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.11;

// File: ink-protocol/contracts/InkOwner.sol

interface InkOwner {
  function authorizeTransaction(uint256 _id, address _buyer) external returns (bool);
}

// File: contracts/InkPay.sol

contract InkPay is InkOwner {
  function authorizeTransaction(uint256 /* _id */, address /* _buyer */) external returns (bool) {
    return true;
  }
}