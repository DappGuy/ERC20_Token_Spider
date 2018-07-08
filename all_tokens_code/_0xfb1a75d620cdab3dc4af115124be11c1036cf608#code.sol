//token_name	
//token_url	https://etherscan.io//address/0xfb1a75d620cdab3dc4af115124be11c1036cf608#code
//spider_time	2018/07/08 11:25:07
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.24;


contract Migrations {
    address public owner;
    uint public last_completed_migration; // solhint-disable-line var-name-mixedcase

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function setCompleted(uint completed) external restricted {
        last_completed_migration = completed;
    }

    function upgrade(address newAddress) external restricted {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(last_completed_migration);
    }
}