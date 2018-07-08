//token_name	
//token_url	https://etherscan.io//address/0xf163484a4b2c32e68b991bc45d7e7fa8c6c596c5#code
//spider_time	2018/07/08 12:44:55
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.19;

contract Token {
    function balanceOf(address) public constant returns (uint);
    function transfer(address, uint) public returns (bool);
}

contract Vault {
    Token constant public token = Token(0xa645264C5603E96c3b0B078cdab68733794B0A71);
    address constant public recipient = 0x002AE208AD6064F75Fa78e7bbeF9B12DB850f559;
    // UNIX timestamp
    uint constant public unlockedAt = 1528397739;
    
    function unlock() public {
        require(now > unlockedAt);
        uint vaultBalance = token.balanceOf(address(this));
        token.transfer(recipient, vaultBalance);
    }
}