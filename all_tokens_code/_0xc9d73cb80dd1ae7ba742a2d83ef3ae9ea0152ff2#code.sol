//token_name	
//token_url	https://etherscan.io//address/0xc9d73cb80dd1ae7ba742a2d83ef3ae9ea0152ff2#code
//spider_time	2018/07/08 11:32:40
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