//token_name	
//token_url	https://etherscan.io//address/0x8D056569B215c8B56e4b3A615DAC425D8d2352A4#code
//spider_time	2018/07/08 11:02:42
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.20;

contract B_GIFT
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