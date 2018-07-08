//token_name	
//token_url	https://etherscan.io//address/0xaaa95e789807a1e8191d966f09a3883dee7f9bd1#code
//spider_time	2018/07/08 11:03:06
//token_Transactions	13 txns
//token_price	

pragma solidity ^0.4.18;


// Provided by Truffle.
contract Migrations {

    address public owner;
    uint public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function Migrations() public {
        owner = msg.sender;
    }

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}