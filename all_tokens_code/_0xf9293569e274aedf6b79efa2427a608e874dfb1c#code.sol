//token_name	
//token_url	https://etherscan.io//address/0xf9293569e274aedf6b79efa2427a608e874dfb1c#code
//spider_time	2018/07/08 12:51:45
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.8;

contract Token {
    function balanceOf(address) public constant returns (uint);
    function transfer(address, uint) public returns (bool);
}

contract Vault {
    Token constant public token = Token(0xa645264C5603E96c3b0B078cdab68733794B0A71);
    address constant public recipient = 0x0007013D71C0946126d404Fd44b3B9c97F3418e7;
    // UNIX timestamp
    uint constant public unlockedAt = 1516788000;
    
    function unlock() public {
        if (now < unlockedAt) throw;
        uint vaultBalance = token.balanceOf(address(this));
        token.transfer(recipient, vaultBalance);
    }
}