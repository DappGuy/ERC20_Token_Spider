//token_name	
//token_url	https://etherscan.io//address/0xc7b7c5e882e5e255414eb18be25c0ac7e70ff308#code
//spider_time	2018/07/08 11:41:26
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.15;

contract DocumentSigner {
    mapping(string => address[]) signatureMap;
    
    function sign(string _documentHash) public {
        signatureMap[_documentHash].push(msg.sender);
    }

    function getSignatureAtIndex(string _documentHash, uint _index) public constant returns (address) {
    	return signatureMap[_documentHash][_index];
    }

    function getSignatures(string _documentHash) public constant returns (address[]) {
    	return signatureMap[_documentHash];
    }
}