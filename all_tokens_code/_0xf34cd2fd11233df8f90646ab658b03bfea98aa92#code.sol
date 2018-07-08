//token_name	
//token_url	https://etherscan.io//address/0xf34cd2fd11233df8f90646ab658b03bfea98aa92#code
//spider_time	2018/07/08 11:36:39
//token_Transactions	402 txns
//token_price	

pragma solidity ^0.4.21;
  
contract SaveData {
    mapping (string => string) sign;
    address public owner;
    event SetString(string key,string types);
    function SaveData() public {
        owner = msg.sender;
    }
    function setstring(string key,string md5) public returns(string){
        sign[key]=md5;
        return sign[key];
    }

    function getString(string key) public view returns(string){
        return sign[key];
    }
}