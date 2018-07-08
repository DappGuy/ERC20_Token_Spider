//token_name	
//token_url	https://etherscan.io//address/0x2842366841B3A117Ef143Cc04568768BE758B49e#code
//spider_time	2018/07/08 12:42:57
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.18;
/*
 * A good friend of mine has been fired from his job just before christmas, in December 2017.
 * Since then, he has been looking for a new job, but wasn't successful due to difficult state of
 * labor market in Czech Republic. This is just another one of my futile attempts to help him.
 *
 * If you have some spare Ethereum, please consider donating to help him in this difficult life situation
*/
contract Charity_For_My_Friend{
    address owner;
    
    function Charity_For_My_Friend() {
        owner = msg.sender;
    }
    
    function kill() {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
    
    function () payable {}
}