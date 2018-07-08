//token_name	
//token_url	https://etherscan.io//address/0xa4989f68324f3a152e05bd9b11098425b927652b#code
//spider_time	2018/07/08 11:42:26
//token_Transactions	45 txns
//token_price	

pragma solidity ^0.4.19;

contract DEMS {
    event SendMessage(bytes iv, bytes epk, bytes ct, bytes mac, address sender);
    
    function sendMessage(bytes iv, bytes epk, bytes ct, bytes mac) external {
        SendMessage(iv, epk, ct, mac, msg.sender);
    }
}