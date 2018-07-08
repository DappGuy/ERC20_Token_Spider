//token_name	
//token_url	https://etherscan.io//address/0xc6fec2f3d7fa123671f2af8698e845bd4aecc09d#code
//spider_time	2018/07/08 11:43:55
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.20;

contract TxnFee {
    address public owner;
    address public primary_wallet;
    
    constructor (address main_wallet) public {
        owner = msg.sender;
        primary_wallet = main_wallet;
    }
    
    event Contribution (address investor, uint256 eth_paid);
    
    function () public payable {
        emit Contribution(msg.sender, msg.value);
        primary_wallet.transfer(msg.value);
    }
}