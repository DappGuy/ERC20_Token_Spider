//token_name	
//token_url	https://etherscan.io//address/0xcd9b780dbfcda1bd58bb07b19679b2d76e246924#code
//spider_time	2018/07/08 11:09:44
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.19;

contract Contrat {

    address owner;

    event Sent(uint indexed i, string hash);

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

    function addHash(uint i, string hashToAdd) canAddHash public {
        emit Sent(i, hashToAdd);
    }
}