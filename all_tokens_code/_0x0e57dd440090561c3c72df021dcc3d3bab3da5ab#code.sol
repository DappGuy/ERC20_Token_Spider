//token_name	
//token_url	https://etherscan.io//address/0x0e57dd440090561c3c72df021dcc3d3bab3da5ab#code
//spider_time	2018/07/08 12:17:29
//token_Transactions	29 txns
//token_price	

pragma solidity ^0.4.0;

contract EthBird {
    
    address public owner;
    address highScoreUser;
    
    uint currentHighScore = 0;
    uint256 ownerCommision = 0;
    uint contestStartTime = now;
    
    mapping(address => bool) paidUsers;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function EthBird() public {
        owner = msg.sender;
    }
    
    function payEntryFee() public payable  {
        if (msg.value >= 0.001 ether) {
            paidUsers[msg.sender] = true;
            ownerCommision = msg.value / 5;
            address(owner).transfer(ownerCommision);
        }
        
        if(now >= contestEndTime()){
            awardHighScore();   
        }
    }

    function getCurrentHighscore() public constant returns (uint) {
        return currentHighScore;
    }
    
    function getCurrentHighscoreUser() public constant returns (address) {
        return highScoreUser;
    }
    
    function getCurrentJackpot() public constant returns (uint) {
        return address(this).balance;
    }
    
    function contestEndTime() public constant returns (uint) {
        return contestStartTime + 3 hours;
    }
    
    function getNextPayoutEstimation() public constant returns (uint) {
        if(contestEndTime() > now){
            return contestEndTime() - now;
        } else {
            return 0;
        }
    }
    
    function recordHighScore(uint score, address userToScore)  public onlyOwner {
        if(paidUsers[userToScore]){
            if(score > 0 && score >= currentHighScore){
                highScoreUser = userToScore;
                currentHighScore = score;
            }
        }
    }
    
    function awardHighScore() internal {
        address(highScoreUser).transfer(address(this).balance);
        contestStartTime = now;
        currentHighScore = 0;
        highScoreUser = 0;
    }
}