//token_name	
//token_url	https://etherscan.io//address/0x70808d21bb92547380977db83541e03564373f0a#code
//spider_time	2018/07/08 11:02:05
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.24;

contract Test {
    event testLog(address indexed account, uint amount);
    
    constructor() public {
        emit testLog(msg.sender, block.number);
    }
    
    function execute(uint number) public returns (bool) {
        emit testLog(msg.sender, number);
        return true;
    }
}