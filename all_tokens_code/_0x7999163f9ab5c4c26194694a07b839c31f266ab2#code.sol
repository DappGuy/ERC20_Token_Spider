//token_name	
//token_url	https://etherscan.io//address/0x7999163f9ab5c4c26194694a07b839c31f266ab2#code
//spider_time	2018/07/08 11:48:13
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.11;

contract Utils {
    function currentTime() public view returns (uint256){
        return uint256(now);
    }
}