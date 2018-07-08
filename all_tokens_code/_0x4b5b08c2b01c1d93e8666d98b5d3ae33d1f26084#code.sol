//token_name	
//token_url	https://etherscan.io//address/0x4b5b08c2b01c1d93e8666d98b5d3ae33d1f26084#code
//spider_time	2018/07/08 12:02:13
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.21;


library StringUtils {
    // Tests for uppercase characters in a given string
    function allLower(string memory _string) internal pure returns (bool) {
        bytes memory bytesString = bytes(_string);
        for (uint i = 0; i < bytesString.length; i++) {
            if ((bytesString[i] >= 65) && (bytesString[i] <= 90)) {  // Uppercase characters
                return false;
            }
        }
        return true;
    }
}