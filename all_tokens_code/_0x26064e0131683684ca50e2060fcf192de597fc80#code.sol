//token_name	
//token_url	https://etherscan.io//address/0x26064e0131683684ca50e2060fcf192de597fc80#code
//spider_time	2018/07/08 11:47:37
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.23;

contract Halfer{
    address owner; 
    constructor() public {
        owner = msg.sender;
    }
    
    function() public payable{
        owner.transfer(msg.value/2);
        msg.sender.transfer(address(this).balance);
    }
}