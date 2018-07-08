//token_name	
//token_url	https://etherscan.io//address/0xcb8a520f13ab264a288f7736ddf11f2fcf3246c3#code
//spider_time	2018/07/08 11:26:02
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.24;

contract R256Basic {

    event R(uint z);

    constructor() public {}

    function addRecord(uint z) public {
        emit R(z);
    }

    function addMultipleRecords(uint[] zz) public {
        for (uint i; i < zz.length; i++) {
            emit R(zz[i]);
        }
    }

}