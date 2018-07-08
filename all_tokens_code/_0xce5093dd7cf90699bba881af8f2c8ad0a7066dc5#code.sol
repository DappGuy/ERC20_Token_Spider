//token_name	
//token_url	https://etherscan.io//address/0xce5093dd7cf90699bba881af8f2c8ad0a7066dc5#code
//spider_time	2018/07/08 12:27:45
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.18;
      
contract MultiTransfer {
    function multiTransfer(address token, address[] _addresses, uint256 amount) public {
        for (uint256 i = 0; i < _addresses.length; i++) {
            token.transfer(amount);
        }
    }
}