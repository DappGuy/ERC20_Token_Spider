//token_name	
//token_url	https://etherscan.io//address/0x4b5cd619741838cb3442831c3f268a78b7df859a#code
//spider_time	2018/07/08 11:17:11
//token_Transactions	11 txns
//token_price	

pragma solidity ^0.4.13;

contract CryptoPeopleName {
    address owner;
    mapping(address => string) private nameOfAddress;
  
    function CryptoPeopleName() public{
        owner = msg.sender;
    }
    
    function setName(string name) public {
        nameOfAddress[msg.sender] = name;
    }
    
    function getNameOfAddress(address _address) public view returns(string _name){
        return nameOfAddress[_address];
    }
    
}