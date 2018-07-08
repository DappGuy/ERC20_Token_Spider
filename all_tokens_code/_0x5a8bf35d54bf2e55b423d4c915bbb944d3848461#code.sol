//token_name	
//token_url	https://etherscan.io//address/0x5a8bf35d54bf2e55b423d4c915bbb944d3848461#code
//spider_time	2018/07/08 12:50:27
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract TradeIO {
    address owner;
    mapping(bytes8 => string) dateToHash;
    
    modifier onlyOwner () {
        require(owner == msg.sender);
        _;
    }
    
    function TradeIO () public {
        owner = msg.sender;
    }
    
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
    
    function saveHash(bytes8 date, string hash) public onlyOwner {
        require(bytes(dateToHash[date]).length == 0);
        dateToHash[date] = hash;
    }
    
    function getHash(bytes8 date) public constant returns (string) {
        require(bytes(dateToHash[date]).length != 0);
        return dateToHash[date];
    }
}