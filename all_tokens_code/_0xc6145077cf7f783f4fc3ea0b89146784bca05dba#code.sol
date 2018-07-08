//token_name	
//token_url	https://etherscan.io//address/0xc6145077cf7f783f4fc3ea0b89146784bca05dba#code
//spider_time	2018/07/08 12:08:39
//token_Transactions	5 txns
//token_price	

pragma solidity ^0.4.21;

contract Hellina{
    address owner;
    function Hellina(){
        owner=msg.sender;
    }
    
    function Buy() payable{
        
    }
    
    function Withdraw(){
        owner.transfer(address(this).balance);
    }
}