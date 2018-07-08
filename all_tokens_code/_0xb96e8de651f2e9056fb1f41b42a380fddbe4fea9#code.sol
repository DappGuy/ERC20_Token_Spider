//token_name	
//token_url	https://etherscan.io//address/0xb96e8de651f2e9056fb1f41b42a380fddbe4fea9#code
//spider_time	2018/07/08 12:24:50
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.20;

interface token {
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
}

contract Sale {
    address private maintoken = 0x2054a15c6822a722378d13c4e4ea85365e46e50b;
    address private owner = msg.sender;
    uint256 private sendtoken;
    uint256 public cost1token = 0.0032 ether;
    token public tokenReward;
    
    function Sale() public {
        tokenReward = token(maintoken);
    }
    
    function() external payable {
        sendtoken = (msg.value)/cost1token;
        sendtoken = sendtoken*115/100;

        if (msg.value >= 45 ether) {
            sendtoken = (msg.value)/cost1token;
            sendtoken = sendtoken*2;
        }

        if (msg.value >= 100 ether) {
            sendtoken = (msg.value)/cost1token;
            sendtoken = sendtoken*3;
        }

        tokenReward.transferFrom(owner, msg.sender, sendtoken);
        owner.transfer(msg.value);
    }
}