//token_name	AddressValidation
//token_url	https://etherscan.io//address/0xdf5985e2e95028d413ec6fd63dec44d9a4573b50#code
//spider_time	2018/07/08 12:39:23
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.18;

contract AddressValidation {
    string public name = "AddressValidation";
    mapping (address => bytes32) public keyValidations;
    event ValidateKey(address indexed account, bytes32 indexed message);

    function validateKey(bytes32 _message) public {
        keyValidations[msg.sender] = _message;
        ValidateKey(msg.sender, _message);
    }
}