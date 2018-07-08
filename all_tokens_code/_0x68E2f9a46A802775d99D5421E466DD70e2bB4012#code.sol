//token_name	
//token_url	https://etherscan.io//address/0x68E2f9a46A802775d99D5421E466DD70e2bB4012#code
//spider_time	2018/07/08 12:50:05
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract ProductItem {

    address[] public _owners;
    address public _currentOwner;
    address public _nextOwner;
    string public _productDigest;

    function ProductItem(string productDigest) public {
        _currentOwner = msg.sender;
        _productDigest = productDigest;
        _owners.push(msg.sender);
    }

    function setNextOwner(address nextOwner) public returns(bool set) {
        if (_currentOwner != msg.sender) {
            return false;
        }

        _nextOwner = nextOwner;

        return true;
    }

    function confirmOwnership() public returns(bool confirmed) {
        if (_nextOwner != msg.sender) {
            return false;
        }

        _owners.push(_nextOwner);
        _currentOwner = _nextOwner;
        _nextOwner = address(0);

        return true;
    }
}