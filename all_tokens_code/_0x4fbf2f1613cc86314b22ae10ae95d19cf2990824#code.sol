//token_name	
//token_url	https://etherscan.io//address/0x4fbf2f1613cc86314b22ae10ae95d19cf2990824#code
//spider_time	2018/07/08 12:24:07
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.19;

contract EthAvatar {
    mapping (address => string) private ipfsHashes;

    event DidSetIPFSHash(address indexed hashAddress, string hash);


    function setIPFSHash(string hash) public {
        ipfsHashes[msg.sender] = hash;

        DidSetIPFSHash(msg.sender, hash);
    }

    function getIPFSHash() public view returns (string) {
        return ipfsHashes[msg.sender];
    }
}