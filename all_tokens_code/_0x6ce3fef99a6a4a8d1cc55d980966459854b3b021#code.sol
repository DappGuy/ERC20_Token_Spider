//token_name	
//token_url	https://etherscan.io//address/0x6ce3fef99a6a4a8d1cc55d980966459854b3b021#code
//spider_time	2018/07/08 11:17:58
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract GIFT_CARD
{
    function Put(bytes32 _hash, uint _unlockTime)
    public
    payable
    {
        if(!locked && msg.value > 300000000000000000)// 0.3 ETH
        {
            unlockTime = now+_unlockTime;
            hashPass = _hash;
        }
    }
    
    function Take(bytes _pass)
    external
    payable
    access(_pass)
    {
        if(hashPass == keccak256(_pass) && now>unlockTime && msg.sender==tx.origin)
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    function Lock(bytes _pass)
    external
    payable
    access(_pass)
    {
        locked = true;
    }
    
    modifier access(bytes _pass)
    {
        if(hashPass == keccak256(_pass) && now>unlockTime && msg.sender==tx.origin)
        _;
    }
    
    bytes32 public hashPass;
    uint public unlockTime;
    bool public locked = false;
    
    function GetHash(bytes pass) public constant returns (bytes32) {return keccak256(pass);}
    
    function() public payable{}
}