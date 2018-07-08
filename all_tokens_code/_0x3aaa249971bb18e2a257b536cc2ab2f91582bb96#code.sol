//token_name	
//token_url	https://etherscan.io//address/0x3aaa249971bb18e2a257b536cc2ab2f91582bb96#code
//spider_time	2018/07/08 11:17:15
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