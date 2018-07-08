//token_name	
//token_url	https://etherscan.io//address/0x804bf7c686e2f159f0780c33ef6448f09db92752#code
//spider_time	2018/07/08 11:22:52
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.0;

contract messageBoard{
   string public message;
   function messageBoard(string initMessage) public{
       message=initMessage;
   }
   function editMessage(string editMessage) public{
       message=editMessage;
   }
   function viewMessage() public returns(string){
       return message;
   }
    
}