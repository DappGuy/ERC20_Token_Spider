//token_name	
//token_url	https://etherscan.io//address/0x6541242ff558fde0c9810c8f4e4506a3a7ff740d#code
//spider_time	2018/07/08 11:23:55
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.23;

contract MyTest{
    string private name;
   
    function setName(string newName) public{
        name=newName;
    }
    
    function getName() public view returns(string){
        return name;
    }
    
}