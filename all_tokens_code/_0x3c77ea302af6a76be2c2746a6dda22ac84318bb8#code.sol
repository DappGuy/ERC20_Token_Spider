//token_name	
//token_url	https://etherscan.io//address/0x3c77ea302af6a76be2c2746a6dda22ac84318bb8#code
//spider_time	2018/07/08 12:09:54
//token_Transactions	260 txns
//token_price	

pragma solidity ^0.4.13;

contract GameAbstraction {
   function sendBet(address sender, uint choice) payable public;
}

contract TeamChoice {

    address gameAddress;
    uint teamChoice;

    function TeamChoice(address _gameAddress, uint _teamChoice) public {
        gameAddress = _gameAddress;
        teamChoice = _teamChoice;
    }

    function fund() payable public {}

    function() payable public {
        GameAbstraction game = GameAbstraction(gameAddress);
        game.sendBet.value(msg.value)(msg.sender, teamChoice);
    }

}

contract TeamHeadsChoice is TeamChoice {

    function TeamHeadsChoice(address _gameAddress) TeamChoice(_gameAddress, 1) public {}

}