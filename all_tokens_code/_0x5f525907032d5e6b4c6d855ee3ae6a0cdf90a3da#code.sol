//token_name	
//token_url	https://etherscan.io//address/0x5f525907032d5e6b4c6d855ee3ae6a0cdf90a3da#code
//spider_time	2018/07/08 12:23:56
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.18;

contract minishop{
    
    event Buy(address indexed producer, bytes32 indexed productHash, address indexed buyer);
    
    function buy(address _producer, bytes32 _productHash) public
    {
        emit Buy(_producer, _productHash, msg.sender);
    }
    
}