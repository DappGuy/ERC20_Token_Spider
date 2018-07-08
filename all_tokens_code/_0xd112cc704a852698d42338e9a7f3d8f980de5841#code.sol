//token_name	
//token_url	https://etherscan.io//address/0xd112cc704a852698d42338e9a7f3d8f980de5841#code
//spider_time	2018/07/08 11:20:34
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.16;

contract IOwned {

    function owner() public pure returns (address) {
        
    }

    function transferOwnership(address _newOwner) public;
    function acceptOwnership() public;
    }

contract Owned is IOwned {
    address public owner;
    address public newOwner;
    event OwnerUpdate(address _prevOwner, address _newOwner);

    function Owned() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != owner);
        newOwner = _newOwner;
    }


    function acceptOwnership() public {
        require(msg.sender == newOwner);
        OwnerUpdate(owner, newOwner);
        owner = newOwner;
        newOwner = 0x0;
    }
}