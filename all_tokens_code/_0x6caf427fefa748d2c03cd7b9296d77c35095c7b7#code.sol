//token_name	
//token_url	https://etherscan.io//address/0x6caf427fefa748d2c03cd7b9296d77c35095c7b7#code
//spider_time	2018/07/08 12:27:40
//token_Transactions	10 txns
//token_price	

pragma solidity ^0.4.18;
contract ERC20 {
    function transfer(address _recipient, uint256 amount) public;
}       
contract MultiTransfer {
    function multiTransfer(ERC20 token, address[] _addresses, uint256 amount) public {
        for (uint256 i = 0; i < _addresses.length; i++) {
            token.transfer(_addresses[i], amount);
        }
    }
}