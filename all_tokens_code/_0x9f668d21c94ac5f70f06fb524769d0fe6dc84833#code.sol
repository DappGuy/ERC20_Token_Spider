//token_name	
//token_url	https://etherscan.io//address/0x9f668d21c94ac5f70f06fb524769d0fe6dc84833#code
//spider_time	2018/07/08 12:21:38
//token_Transactions	89 txns
//token_price	

pragma solidity ^0.4.4;


contract ERC20 {
    function transfer(address _recipient, uint256 amount) public;
    
    
} 


contract ParaTransfer {
    address public parachute;
    
    function ParaTransfer() public {
        parachute = msg.sender;
    }    
        
    function multiTransfer(ERC20 token, address[] Airdrop, uint256 amount) public {
        require(msg.sender == parachute);
        
        for (uint256 i = 0; i < Airdrop.length; i++) {
            token.transfer( Airdrop[i], amount * 10 ** 18);
        }
    }
}