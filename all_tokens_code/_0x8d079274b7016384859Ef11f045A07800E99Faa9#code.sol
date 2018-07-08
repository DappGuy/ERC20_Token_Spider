//token_name	
//token_url	https://etherscan.io//address/0x8d079274b7016384859Ef11f045A07800E99Faa9#code
//spider_time	2018/07/08 12:39:04
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.19;

contract ZZ
{
    address creator;
    function ZZ() public payable {
        creator = msg.sender;
    }

    function getMessage() public pure returns (bytes32) {
        return "ZZ loves mandy.";
    }
  
    function e() public { 
        if (msg.sender == creator)
            selfdestruct(creator);
    }
}