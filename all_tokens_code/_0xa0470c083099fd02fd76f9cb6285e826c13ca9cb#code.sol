//token_name	
//token_url	https://etherscan.io//address/0xa0470c083099fd02fd76f9cb6285e826c13ca9cb#code
//spider_time	2018/07/08 11:31:00
//token_Transactions	831 txns
//token_price	

pragma solidity ^0.4.21;

contract IPFSStore {
    mapping (uint256 => string) hashes;
    address owner;

    function IPFSStore() public {
        owner = msg.sender;
    }

    function setHash(uint256 time_stamp, string ipfs_hash) public {
        require(msg.sender == owner);
        hashes[time_stamp] = ipfs_hash;
    }

    function getHash(uint256 time_stamp) constant public returns (string) {
        return hashes[time_stamp];
    }
}