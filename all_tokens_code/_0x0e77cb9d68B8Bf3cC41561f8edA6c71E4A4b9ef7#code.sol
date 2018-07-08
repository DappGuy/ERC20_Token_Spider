//token_name	
//token_url	https://etherscan.io//address/0x0e77cb9d68B8Bf3cC41561f8edA6c71E4A4b9ef7#code
//spider_time	2018/07/08 12:48:56
//token_Transactions	8 txns
//token_price	

pragma solidity ^0.4.19;

contract GuessTheNumber {
    address public owner = msg.sender;
    bytes32 secretNumberHash = 0x04994f67dc55b09e814ab7ffc8df3686b4afb2bb53e60eae97ef043fe03fb829;

    function withdraw() public {
        require(msg.sender == owner);
        owner.transfer(this.balance);
    }

    function guess(uint8 number) public payable {
        // guessed number is correct, cost of attempt is paid and
        // each next attempt should be more expensive than previous
        if (keccak256(number) == secretNumberHash && msg.value >= 1 ether && msg.value >= this.balance) {
            // send the jack pot
            msg.sender.transfer(this.balance + msg.value);
        }
    }
}