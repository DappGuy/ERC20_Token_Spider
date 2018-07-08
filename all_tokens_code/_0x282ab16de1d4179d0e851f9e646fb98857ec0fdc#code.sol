//token_name	
//token_url	https://etherscan.io//address/0x282ab16de1d4179d0e851f9e646fb98857ec0fdc#code
//spider_time	2018/07/08 11:10:53
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract Contrat {

    address owner;

    event Sent(string hash);

    constructor() public {
        owner = msg.sender;
    }

    modifier canAddHash() {
        bool isOwner = false;

        if (msg.sender == owner)
            isOwner = true;

        require(isOwner);
        _;
    }

    function addHash(string hashToAdd) canAddHash public {
        emit Sent(hashToAdd);
    }
}