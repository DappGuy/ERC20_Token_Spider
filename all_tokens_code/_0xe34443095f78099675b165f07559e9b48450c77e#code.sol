//token_name	
//token_url	https://etherscan.io//address/0xe34443095f78099675b165f07559e9b48450c77e#code
//spider_time	2018/07/08 12:52:19
//token_Transactions	5 txns
//token_price	

pragma solidity ^0.4.18;


contract Depay {

    address public developer;
    uint public donations;

    function Depay() public {
        developer = msg.sender;
    }

    event Payment(address indexed sender, address indexed receiver, uint indexed amount, uint donation);
    function pay(address recipient, uint donation) public payable {
        require(donation < msg.value);
        recipient.transfer(msg.value - donation);
        donations += donation;
        Payment(msg.sender, recipient, msg.value - donation, donation);
    }

    function withdrawDonations(address recipient) public {
        require(msg.sender == developer);
        recipient.transfer(donations);
        donations = 0;
    }
}