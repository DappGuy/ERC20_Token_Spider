//token_name	
//token_url	https://etherscan.io//address/0x5f09f0ee8115a6c55725641c1aff2775675b2466#code
//spider_time	2018/07/08 12:46:46
//token_Transactions	1 txn
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
    uint constant public unlockedAt = 1517571900;
    
    function unlock() public {
        require(now > unlockedAt);
        uint vaultBalance = token.balanceOf(address(this));
        token.transfer(recipient, vaultBalance);
    }
}