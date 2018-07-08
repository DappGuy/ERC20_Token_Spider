//token_name	
//token_url	https://etherscan.io//address/0x8c43c4d4cfef47429f17eb4ecd7b090ec0e976af#code
//spider_time	2018/07/08 11:24:32
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.21;

contract MineContractAddress {
    function mine(
        address _account, 
        uint _nonce
    ) public pure returns(address _contract) {
        if (_nonce == 0) _nonce = 128;
        _contract = address(keccak256(bytes2(0xd694), _account, byte(_nonce)));
    }
}