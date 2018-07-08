//token_name	
//token_url	https://etherscan.io//address/0x7c6546bea18e7d3f734b16ceb76950cb47c55fc5#code
//spider_time	2018/07/08 11:43:18
//token_Transactions	1443 txns
//token_price	

pragma solidity ^0.4.23;


contract MintableTokenIface {
    function mint(address beneficiary, uint256 amount) public returns (bool);
    function transfer(address to, uint256 value) public returns (bool);
}


contract BatchAirDrop {
    MintableTokenIface public token;
    address public owner;

    constructor(MintableTokenIface _token) public {
        owner = msg.sender;
        token = _token;
    }

    function batchSend(uint256 amount, address[] wallets) public {
        require(msg.sender == owner);
        require(amount != 0);
        for (uint256 i = 0; i < wallets.length; i++) {
            token.transfer(wallets[i], amount);
        }
    }
}