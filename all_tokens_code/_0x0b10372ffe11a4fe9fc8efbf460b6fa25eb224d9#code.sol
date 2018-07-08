//token_name	
//token_url	https://etherscan.io//address/0x0b10372ffe11a4fe9fc8efbf460b6fa25eb224d9#code
//spider_time	2018/07/08 12:12:53
//token_Transactions	3 txns
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