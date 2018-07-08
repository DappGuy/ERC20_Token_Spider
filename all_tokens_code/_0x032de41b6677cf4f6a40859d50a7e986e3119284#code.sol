//token_name	
//token_url	https://etherscan.io//address/0x032de41b6677cf4f6a40859d50a7e986e3119284#code
//spider_time	2018/07/08 11:08:25
//token_Transactions	1 txn
//token_price	

/**
* @title BurnABLE
* @dev ABLE burn contract.
*/
contract ABLEBurned {

    /**
    * @dev Function to contruct.
    */
    function () payable {
    }

    /**
    * @dev Function to Selfdestruct contruct.
    */
    function burnMe () {
        // Selfdestruct and send eth to self, 
        selfdestruct(address(this));
    }
}