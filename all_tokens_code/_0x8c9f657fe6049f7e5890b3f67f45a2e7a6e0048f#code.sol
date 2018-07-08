//token_name	
//token_url	https://etherscan.io//address/0x8c9f657fe6049f7e5890b3f67f45a2e7a6e0048f#code
//spider_time	2018/07/08 12:50:54
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.16;

contract TokenBurner {
    address private _burner;

    function TokenBurner() public {
        _burner = msg.sender;
    }

    function () payable public {
    }

    function BurnMe () public {
        // Only let ourselves be able to burn
        if (msg.sender == _burner) {
            // Selfdestruct and send tokens to self, to burn them 
            selfdestruct(address(this));
        }
        
    }
}