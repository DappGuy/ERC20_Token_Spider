//token_name	
//token_url	https://etherscan.io//address/0x67af54d9e20fe6f9dd2dfe0449ed65f97a3638de#code
//spider_time	2018/07/08 11:33:57
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.24;

contract MultiSender {
    function multiSend(uint256 amount, address[] addresses) public returns (bool) {
        for (uint i = 0; i < addresses.length; i++) {
            addresses[i].transfer(amount);
        }
    }

    function () public payable {
        
    }
}