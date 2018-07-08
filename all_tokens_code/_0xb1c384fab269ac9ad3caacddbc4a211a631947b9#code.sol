//token_name	
//token_url	https://etherscan.io//address/0xb1c384fab269ac9ad3caacddbc4a211a631947b9#code
//spider_time	2018/07/08 12:53:08
//token_Transactions	0 txns
//token_price	

pragma solidity ^0.4.18;
contract NumberFactory{
    event NumberCreated(address);
    address public last;
 function createNumber(uint _number) public {
     last= new Number(_number);
     NumberCreated(last);
     
    
 } 
}

contract Number {
    uint number;
    
    function Number(uint _number) public {
    number=_number;
    }
    function change(uint _number) public {
    number=_number;
    }
}