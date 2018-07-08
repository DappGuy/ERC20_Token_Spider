//token_name	
//token_url	https://etherscan.io//address/0xd7E97C8dB67D0F2CcfeAd3ab9f5F9a3cC727518A#code
//spider_time	2018/07/08 12:31:21
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.15;

contract LndrJPY {
    function allowTransaction(address creditor, address debtor, uint256 amount) public returns (bool) {
        return true;
    }
}