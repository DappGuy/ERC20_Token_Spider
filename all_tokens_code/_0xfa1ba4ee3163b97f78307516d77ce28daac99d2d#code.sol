//token_name	
//token_url	https://etherscan.io//address/0xfa1ba4ee3163b97f78307516d77ce28daac99d2d#code
//spider_time	2018/07/08 11:47:53
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.23;

interface ERC20 {
    function decimals() external view returns(uint);
}

contract GetDecimals {
    function getDecimals(ERC20 token) external view returns (uint){
        bytes memory data = abi.encodeWithSignature("decimals()");
        if(!address(token).call(data)) {
            // call failed
            return 18;
        }
        else {
            return token.decimals();
        }
    }
}