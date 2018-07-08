//token_name	
//token_url	https://etherscan.io//address/0xbd858b7014ac1ec7e5d420bfcdd4a748f8aeacd5#code
//spider_time	2018/07/08 12:26:06
//token_Transactions	4 txns
//token_price	

pragma solidity 0.4.18;

contract Verification{
    function() payable public{
        msg.sender.transfer(msg.value);
    }
}