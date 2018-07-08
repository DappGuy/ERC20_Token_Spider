//token_name	
//token_url	https://etherscan.io//address/0x342F4057110bE50957d0f156F4939a929944C69e#code
//spider_time	2018/07/08 12:33:58
//token_Transactions	224 txns
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
    function multisetUserCategory(address[] users, uint category, whitelist listContract) public {
        require(msg.sender == owner);

        for(uint i = 0 ; i < users.length ; i++ ) {
            listContract.setUserCategory(users[i],category);
        }
    }
}