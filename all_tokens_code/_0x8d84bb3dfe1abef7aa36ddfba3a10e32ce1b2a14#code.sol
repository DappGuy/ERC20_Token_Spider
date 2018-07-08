//token_name	
//token_url	https://etherscan.io//address/0x8d84bb3dfe1abef7aa36ddfba3a10e32ce1b2a14#code
//spider_time	2018/07/08 12:40:45
//token_Transactions	12 txns
//token_price	

pragma solidity ^0.4.0;
contract OWN_ME {
    address public owner = msg.sender;
    uint256 public price = 1 finney;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function change_price(uint256 newprice) onlyOwner public {
        price = newprice;
    }
   
    function BUY_ME() public payable {
        require(msg.value >= price);
        address tmp = owner;
        owner = msg.sender;
        tmp.transfer(msg.value);
    }
}