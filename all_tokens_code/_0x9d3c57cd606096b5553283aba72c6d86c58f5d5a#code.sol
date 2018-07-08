//token_name	
//token_url	https://etherscan.io//address/0x9d3c57cd606096b5553283aba72c6d86c58f5d5a#code
//spider_time	2018/07/08 12:25:13
//token_Transactions	100 txns
//token_price	

pragma solidity ^0.4.18;

contract crowdsale  {

mapping(address => bool) public whiteList;
event logWL(address wallet, uint256 currenttime);

    function addToWhiteList(address _wallet) public  {
        whiteList[_wallet] = true;
        logWL (_wallet, now);
    }
}