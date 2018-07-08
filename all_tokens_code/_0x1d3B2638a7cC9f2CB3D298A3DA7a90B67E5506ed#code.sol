//token_name	
//token_url	https://etherscan.io//address/0x1d3B2638a7cC9f2CB3D298A3DA7a90B67E5506ed#code
//spider_time	2018/07/08 11:41:47
//token_Transactions	5 txns
//token_price	

/*
  Copyright (c) 2015-2016 Oraclize SRL
  Copyright (c) 2016 Oraclize LTD
*/

contract OraclizeAddrResolver {

    address public addr;

    address owner;

    function OraclizeAddrResolver(){
        owner = msg.sender;
    }

    function changeOwner(address newowner){
        if (msg.sender != owner) throw;
        owner = newowner;
    }

    function getAddress() returns (address oaddr){
        return addr;
    }

    function setAddr(address newaddr){
        if (msg.sender != owner) throw;
        addr = newaddr;
    }

}