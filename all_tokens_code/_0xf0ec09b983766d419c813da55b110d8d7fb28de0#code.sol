//token_name	
//token_url	https://etherscan.io//address/0xf0ec09b983766d419c813da55b110d8d7fb28de0#code
//spider_time	2018/07/08 11:38:59
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.4;


contract showNum {
    address owner = msg.sender;

    uint _num = 0;
   function setNum(uint number) public payable {
        _num = number;
    }

    function getNum() constant public returns(uint) {
        return _num;
    }
}