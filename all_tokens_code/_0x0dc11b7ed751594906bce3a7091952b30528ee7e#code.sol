//token_name	
//token_url	https://etherscan.io//address/0x0dc11b7ed751594906bce3a7091952b30528ee7e#code
//spider_time	2018/07/08 12:30:22
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.17;

contract DickMeasurementContest {

    uint lastBlock;
    address owner;

    modifier onlyowner {
        require (msg.sender == owner);
        _;
    }

    function DickMeasurementContest() public {
        owner = msg.sender;
    }

    function () public payable {}

    function mineIsBigger() public payable {
        if (msg.value > this.balance) {
            owner = msg.sender;
            lastBlock = now;
        }
    }

    function withdraw() public onlyowner {
        // if there are no contestants within 3 days
        // the winner is allowed to take the money
        require(now > lastBlock + 3 days);
        msg.sender.transfer(this.balance);
    }

    function kill() public onlyowner {
        if(this.balance == 0) {  
            selfdestruct(msg.sender);
        }
    }
}