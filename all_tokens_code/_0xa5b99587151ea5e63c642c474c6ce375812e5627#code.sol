//token_name	
//token_url	https://etherscan.io//address/0xa5b99587151ea5e63c642c474c6ce375812e5627#code
//spider_time	2018/07/08 12:23:24
//token_Transactions	88 txns
//token_price	

pragma solidity ^0.4.0;

contract EthBird {
    
    address public owner;
    address highScoreUser;
    
    uint currentHighScore = 0;
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
    
    function getNextPayoutEstimation() public constant returns (uint) {
        return (contestStartTime + 1 days) - now;
    }
    
    function recordHighScore(uint score, address userToScore)  public onlyOwner returns (address) {
        if(paidUsers[userToScore]){
            if(score > 0 && score >= currentHighScore){
                highScoreUser = userToScore;
                currentHighScore = score;
            }
            if(now >= contestStartTime + 1 days){
                awardHighScore();   
            }
        }
        return userToScore;
    }
    
    function awardHighScore() public onlyOwner {
        uint256 ownerCommision = address(this).balance / 10;
        address(owner).transfer(ownerCommision);
        address(highScoreUser).transfer(address(this).balance);
        contestStartTime = now;
    }
}