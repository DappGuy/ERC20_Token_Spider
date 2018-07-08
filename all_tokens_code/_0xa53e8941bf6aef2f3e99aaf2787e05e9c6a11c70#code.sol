//token_name	
//token_url	https://etherscan.io//address/0xa53e8941bf6aef2f3e99aaf2787e05e9c6a11c70#code
//spider_time	2018/07/08 11:55:24
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.16;
 
contract CodexBeta {
    struct MyCode {
        string code;
    }
    event Record(string code);
    function record(string code) public {
        registry[msg.sender] = MyCode(code);
    }
    mapping (address => MyCode) public registry;
}