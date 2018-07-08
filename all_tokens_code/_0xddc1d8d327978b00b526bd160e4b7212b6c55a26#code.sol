//token_name	
//token_url	https://etherscan.io//address/0xddc1d8d327978b00b526bd160e4b7212b6c55a26#code
//spider_time	2018/07/08 12:31:21
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.15;

contract LndrKRW {
    function allowTransaction(address creditor, address debtor, uint256 amount) public returns (bool) {
        return true;
    }
}