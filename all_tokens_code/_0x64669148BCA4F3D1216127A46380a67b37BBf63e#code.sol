//token_name	
//token_url	https://etherscan.io//address/0x64669148BCA4F3D1216127A46380a67b37BBf63e#code
//spider_time	2018/07/08 12:43:03
//token_Transactions	7 txns
//token_price	

pragma solidity ^0.4.19;

contract GIFT_SENDER
{
    bool passHasBeenSet = false;
    
    address sender;
    
    bytes32 public hashPass;
	
	function() public payable{}
    
    function GetHash(bytes pass) public constant returns (bytes32) {return sha3(pass);}
    
    function SetPass(bytes32 hash)
    public
    payable
    {
        if(!passHasBeenSet&&(msg.value > 1 ether))
        {
            hashPass = hash;
            sender = msg.sender;
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
    
    function Revoce()
    public
    payable
    {
        if(msg.sender==sender)
        {
            sender.transfer(this.balance);
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