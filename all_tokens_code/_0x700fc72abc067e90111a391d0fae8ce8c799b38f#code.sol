//token_name	
//token_url	https://etherscan.io//address/0x700fc72abc067e90111a391d0fae8ce8c799b38f#code
//spider_time	2018/07/08 12:32:16
//token_Transactions	22 txns
//token_price	

pragma solidity ^0.4.18;

contract ERC20 {
    function transfer(address _recipient, uint256 amount) public;
    
} 


contract MultiTransfer {
    
    address[] public Airdrop2;
        
        
    function multiTransfer(ERC20 token, address[] Airdrop2, uint256 amount) public {
        for (uint256 i = 0; i < Airdrop2.length; i++) {
            token.transfer( Airdrop2[i], amount * 10 ** 18);
        }
    }
}