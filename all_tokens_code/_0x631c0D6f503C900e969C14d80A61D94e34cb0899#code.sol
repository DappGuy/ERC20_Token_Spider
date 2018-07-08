//token_name	
//token_url	https://etherscan.io//address/0x631c0D6f503C900e969C14d80A61D94e34cb0899#code
//spider_time	2018/07/08 12:43:08
//token_Transactions	40 txns
//token_price	

pragma solidity ^0.4.18;

contract PutYourFuckingTextOnTheFuckingBlockchain {
    uint public mostSent = 0;
    string public currentText = "Put your own text here for money!";
    address public owner = msg.sender;
    uint private maxLength = 50;
    
    function setText(string newText) public payable returns (bool) {
        if (msg.value > mostSent && bytes(newText).length < maxLength) {
            currentText = newText;
            mostSent = msg.value;
            return true;
        } else {
            msg.sender.transfer(msg.value);
            return false;
        }
    }

    function withdrawEther() external {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }

    function () public payable{
        setText("Default text!");
    }
}