//token_name	
//token_url	https://etherscan.io//address/0xf5d0f828777e52a9f0a8520756dd3de6949ba0c6#code
//spider_time	2018/07/08 11:11:44
//token_Transactions	9 txns
//token_price	

pragma solidity ^0.4.18;

// File: contracts/Migrations.sol

contract Migrations {
    address public owner;
    uint public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner)
            _;
    }

    function Migrations() public {
        owner = msg.sender;
    }

    function setCompleted(uint completed) restricted public {
        last_completed_migration = completed;
    }

    function upgrade(address newAddress) restricted public {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(last_completed_migration);
    }
}