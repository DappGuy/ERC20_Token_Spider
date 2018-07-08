//token_name	
//token_url	https://etherscan.io//address/0xc4c89dd46524c6f704e92a9cd012a3ebadadff36#code
//spider_time	2018/07/08 11:57:13
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.0;

contract HelloWorld {
    address public owner;
    
    modifier onlyOwner() { require(msg.sender == owner); _; }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function salutaAndonio() public pure returns(bytes32 hw) {
        hw = "HelloWorld";
    }
    
    function killMe() public onlyOwner {
        selfdestruct(owner);
    }
    
}