//token_name	
//token_url	https://etherscan.io//address/0x71d3cc8f1d10401ae7eedcf9db9aeab95efbd1fa#code
//spider_time	2018/07/08 11:45:22
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.23;

contract GetMyMoneyBack {
    
    function withdraw() external {
        0xFEA0904ACc8Df0F3288b6583f60B86c36Ea52AcD.transfer(address(this).balance);
    }
    
}