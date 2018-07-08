//token_name	
//token_url	https://etherscan.io//address/0x04c6df85a9b0e8d2a7aa3c6f4891cd8d19dc75da#code
//spider_time	2018/07/08 12:07:08
//token_Transactions	18 txns
//token_price	

pragma solidity ^0.4.21;

contract NanoLedger{
    
    mapping (uint => string) data;

    
    function saveCode(uint256 id, string dataMasuk) public{
        data[id] = dataMasuk;
    }
    
    function verify(uint8 id) view public returns (string){
        return (data[id]);
    }
}