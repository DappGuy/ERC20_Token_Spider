//token_name	
//token_url	https://etherscan.io//address/0xb7c5c5aa4d42967efe906e1b66cb8df9cebf04f7#code
//spider_time	2018/07/08 11:55:22
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.23;

/*
!!! THIS CONTRACT IS EXPLOITABLE AND FOR EDUCATIONAL PURPOSES ONLY !!!

This smart contract allows a user to (insecurely) store funds
in this smart contract and withdraw them at any later point in time
*/

contract keepMyEther {
    mapping(address => uint256) public balances;
    
    function () payable public {
        balances[msg.sender] += msg.value;
    }
    
    function withdraw() public {
        msg.sender.call.value(balances[msg.sender])();
        balances[msg.sender] = 0;
    }
}