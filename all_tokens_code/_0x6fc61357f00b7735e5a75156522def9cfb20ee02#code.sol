//token_name	
//token_url	https://etherscan.io//address/0x6fc61357f00b7735e5a75156522def9cfb20ee02#code
//spider_time	2018/07/08 12:10:41
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.18;



/// @title Kyber constants contract
contract Utils {
  function testrc(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public pure returns(address) {
    return ecrecover(hash, v, r, s);
  }

  function hash(uint x, uint y, uint z, uint w) public pure returns(bytes32) {
    return sha3(x,y,z,w);
  }
}