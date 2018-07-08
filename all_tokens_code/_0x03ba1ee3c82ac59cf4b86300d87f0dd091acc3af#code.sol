//token_name	
//token_url	https://etherscan.io//address/0x03ba1ee3c82ac59cf4b86300d87f0dd091acc3af#code
//spider_time	2018/07/08 12:25:23
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.18;


interface whitelist {
    function setUserCategory(address user, uint category) external;
}


contract MultiWhitelist {
    address public owner;

    function MultiWhitelist(address _owner) public {
        owner = _owner;
    }
    function transferOwner(address _owner) public {
        require(msg.sender == owner);
        owner = _owner;
    }
    function multisetUserCategory(address[] users, uint category, whitelist listContract) public {
        require(msg.sender == owner);
        require(category == 4);

        for(uint i = 0 ; i < users.length ; i++ ) {
            listContract.setUserCategory(users[i],category);
        }
    }
}