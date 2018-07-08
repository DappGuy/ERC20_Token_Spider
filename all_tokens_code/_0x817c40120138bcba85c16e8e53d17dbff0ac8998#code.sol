//token_name	
//token_url	https://etherscan.io//address/0x817c40120138bcba85c16e8e53d17dbff0ac8998#code
//spider_time	2018/07/08 11:38:59
//token_Transactions	5 txns
//token_price	

pragma solidity  0.4.24;


contract showNum {
    address owner = msg.sender;
    uint _num = 0;
    constructor(uint number) public {
        _num = number;
    }
    function setNum(uint number) public payable {
        _num = number;
    }
    function getNum() constant public returns(uint) {
        return _num;
    }
}