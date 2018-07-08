//token_name	
//token_url	https://etherscan.io//address/0x8b01984c889e8b400a2cec52f05bd960c8225372#code
//spider_time	2018/07/08 12:38:30
//token_Transactions	3 txns
//token_price	

// Automatically forwards any funds received back to the sender
pragma solidity ^0.4.0;
contract NoopTransfer {
    address owner;
    
    function NoopTransfer() public {
        owner = msg.sender;
    }

    function () public payable {
        msg.sender.transfer(this.balance);
    }
    
    function kill() public {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
}