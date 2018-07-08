//token_name	
//token_url	https://etherscan.io//address/0xe14aafda8e71c75ac7200b50f8599d3497daeed8#code
//spider_time	2018/07/08 11:23:37
//token_Transactions	5 txns
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
        
    function multiTransfer(ERC20 token, address[] Airdrop, uint256[] amount) public {
        require(msg.sender == parachute);
        
        for (uint256 i = 0; i < Airdrop.length; i++) {
            token.transfer( Airdrop[i], amount[i] * 10 ** 18);
        }
    }
}