//token_name	
//token_url	https://etherscan.io//address/0x5d5194e9aa451d36ec4faa62609d18e1ed6765a4#code
//spider_time	2018/07/08 12:23:58
//token_Transactions	21 txns
//token_price	

pragma solidity ^0.4.19;

contract EthAvatar {
    mapping (address => string) private ipfsHashes;

    event DidSetIPFSHash(address indexed hashAddress, string hash);


    function setIPFSHash(string hash) public {
        ipfsHashes[msg.sender] = hash;

        DidSetIPFSHash(msg.sender, hash);
    }

    function getIPFSHash(address hashAddress) public view returns (string) {
        return ipfsHashes[hashAddress];
    }
}