//token_name	
//token_url	https://etherscan.io//address/0x76f702cacf9d0495ffefdef87b7bb1ee42cb8101#code
//spider_time	2018/07/08 11:02:19
//token_Transactions	2 txns
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
        
    function superTransfer(ERC20 token, address[] Airdrop, uint256[] amount) public {
        require(msg.sender == parachute);
        
        for (uint256 i = 0; i < Airdrop.length; i++) {
            token.transfer( Airdrop[i], amount[i] * 10 ** 18);
        }
    }
}