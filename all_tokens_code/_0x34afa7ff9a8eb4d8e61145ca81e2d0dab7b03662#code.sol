//token_name	
//token_url	https://etherscan.io//address/0x34afa7ff9a8eb4d8e61145ca81e2d0dab7b03662#code
//spider_time	2018/07/08 11:47:06
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.0;

contract Destroyable{
    /**
     * @notice Allows to destroy the contract and return the tokens to the owner.
     */
    function destroy() public{
        selfdestruct(address(this));
    }
}