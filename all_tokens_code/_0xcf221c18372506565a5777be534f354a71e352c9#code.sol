//token_name	
//token_url	https://etherscan.io//address/0xcf221c18372506565a5777be534f354a71e352c9#code
//spider_time	2018/07/08 11:30:29
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.24;

contract Sale {
    address private owner80 = 0xf2b9DA535e8B8eF8aab29956823df7237f1863A3;
    address private owner20 = 0x29FD9956553b9Ce92e658662b2F73d95CF90A969;
    uint256 private ether80;
    uint256 private ether20;

    function Sale() public {

    }
    
    function() external payable {
        ether20 = (msg.value)/5;
        ether80 = (msg.value)-ether20;
        owner80.transfer(ether80);
        owner20.transfer(ether20);
    }
}