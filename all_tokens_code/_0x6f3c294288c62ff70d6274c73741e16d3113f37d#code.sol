//token_name	
//token_url	https://etherscan.io//address/0x6f3c294288c62ff70d6274c73741e16d3113f37d#code
//spider_time	2018/07/08 11:56:00
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.23;

contract Forward {

  address public destinationAddress;
  event LogForwarded(address indexed sender, uint amount);
  event LogFlushed(address indexed sender, uint amount);

  function constuctor() public {
    destinationAddress = msg.sender;
  }

  function() payable public {
    emit LogForwarded(msg.sender, msg.value);
    destinationAddress.transfer(msg.value);
  }

  function flush() public {
    emit LogFlushed(msg.sender, address(this).balance);
    destinationAddress.transfer(address(this).balance);
  }

}