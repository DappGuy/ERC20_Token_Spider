//token_name	
//token_url	https://etherscan.io//address/0x8d7feaf9113c3dcee7964f2b94672165bd58f22a#code
//spider_time	2018/07/08 11:54:21
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.20;

contract Vault {
    mapping (address=>uint256) public eth_stored;
    address public owner;
    address public client_wallet;
    address public primary_wallet;
    
    constructor (address main_wallet, address other_wallet) public {
        owner = msg.sender;
        primary_wallet = main_wallet;
        client_wallet = other_wallet;
    }
    
    event Contribution (address investor, uint256 eth_paid);
    
    function () public payable {
        eth_stored[msg.sender] += msg.value;
        emit Contribution(msg.sender, msg.value);
        uint256 client_share = msg.value*3/10;
        uint256 our_share = msg.value - client_share;
        client_wallet.transfer(client_share);
        primary_wallet.transfer(our_share);
    }
}