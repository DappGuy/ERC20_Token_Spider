//token_name	
//token_url	https://etherscan.io//address/0x029cb57991b2a2cad9271b8c4131bb8551982014#code
//spider_time	2018/07/08 11:08:13
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.22;
contract LoeriadeNabidaz{
    uint public c;
    
    function pay() payable public {
        require(msg.value==0.0001 ether);
        c = c+1;
        if(c==2) {
            msg.sender.transfer(this.balance);
            c = 0;
        }
    }
}