//token_name	
//token_url	https://etherscan.io//address/0x6e00d60e15c9a60ba18d5b7aca7ee37777be2a7d#code
//spider_time	2018/07/08 12:45:27
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.19;

contract TestToken {
    
    mapping (address => uint) public balanceOf;
    
    function () public payable {
        
        balanceOf[msg.sender] = msg.value;
        
    }
    
}