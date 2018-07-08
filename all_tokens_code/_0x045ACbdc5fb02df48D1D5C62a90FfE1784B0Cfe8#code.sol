//token_name	
//token_url	https://etherscan.io//address/0x045ACbdc5fb02df48D1D5C62a90FfE1784B0Cfe8#code
//spider_time	2018/07/08 12:34:08
//token_Transactions	5 txns
//token_price	

pragma solidity ^0.4.20;
contract MessagingContract {
    struct Message {
        string data;
        string senderName;
    }
    struct Feed {
        Message[] messages;
        string name;
    }
    event FeedCreated(uint256 feedId,string feedName);
    event MessageSent(uint256 feedId, uint256 msgId,string msg,string sender);
    Feed[] feeds;
    /// Create a new ballot with $(_numProposals) different proposals.
    function MessagingContract(string firstFeedName) public {
        newFeed(firstFeedName);
    }
    function newFeed(string name) public returns (uint256){
        feeds[feeds.length++].name=name;
        FeedCreated(feeds.length-1,name);
        return feeds.length-1;
    }
    function feedMessage(uint256 feedId,string data,string alias) public{
        feeds[feedId].messages[feeds[feedId].messages.length++]=Message(data,alias);
        MessageSent(feedId,feeds[feedId].messages.length-1,data,alias);
    }
}