//token_name	
//token_url	https://etherscan.io//address/0xede79a28fe8e2edb3efb629e7396034f76c22cc3#code
//spider_time	2018/07/08 12:50:12
//token_Transactions	8 txns
//token_price	

pragma solidity ^0.4.18;

// Free money. No bamboozle.
// By NR
contract FreeMoney {
    
    uint public remaining;
    
    function FreeMoney() public payable {
        remaining += msg.value;
    }
    
    // Feel free to give money to whomever
    function() payable {
        remaining += msg.value;
    }
    
    // You're welcome?!
    function withdraw() public {
        remaining = 0;
        msg.sender.transfer(this.balance);
    }
}