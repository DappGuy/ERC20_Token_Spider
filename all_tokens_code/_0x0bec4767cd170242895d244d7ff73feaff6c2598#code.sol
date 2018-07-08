//token_name	
//token_url	https://etherscan.io//address/0x0bec4767cd170242895d244d7ff73feaff6c2598#code
//spider_time	2018/07/08 12:10:40
//token_Transactions	218 txns
//token_price	

pragma solidity ^0.4.2;

contract Numa {

    event NewBatch(
        bytes32 indexed ipfsHash
    );

    function Numa() public { }
    
    function newBatch(bytes32 ipfsHash) public {
        NewBatch(ipfsHash);
    }
}