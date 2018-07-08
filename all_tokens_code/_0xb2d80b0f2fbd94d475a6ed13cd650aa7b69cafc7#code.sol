//token_name	
//token_url	https://etherscan.io//address/0xb2d80b0f2fbd94d475a6ed13cd650aa7b69cafc7#code
//spider_time	2018/07/08 11:15:42
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.20;

contract dubbel {
    address public previousSender;
    uint public price = 0.001 ether;
    
    function() public payable {
            require(msg.value == price);
            previousSender.transfer(msg.value);
            price *= 2;
            previousSender = msg.sender;
    }
}