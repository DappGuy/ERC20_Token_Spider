//token_name	
//token_url	https://etherscan.io//address/0x2f976a5382c0c6214b3d8fe6bdc5379edd35d9d4#code
//spider_time	2018/07/08 12:23:54
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.0;
contract GetsBurned {
    function () payable public {
    }

    function BurnMe() public {
        // Selfdestruct and send eth to self, 
        selfdestruct(address(this));
    }
}