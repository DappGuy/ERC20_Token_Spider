//token_name	
//token_url	https://etherscan.io//address/0x5485c751c582eaf9e8d0ec47d754ee66a2e6e9eb#code
//spider_time	2018/07/08 12:42:24
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.0;
contract Test {

    function send(address to) public{
        if (to.call("0xabcdef")) {
            return;
        } else {
            revert();
        }
    }
}