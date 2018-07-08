//token_name	
//token_url	https://etherscan.io//address/0x05a2f46b2409fe46b8c1f87af2508e7aef5aa8fa#code
//spider_time	2018/07/08 12:37:25
//token_Transactions	7 txns
//token_price	

pragma solidity ^0.4.19;
contract Token {
    function transfer(address _to, uint _value) returns (bool success);
    function balanceOf(address _owner) constant returns (uint balance);
}
contract EtherGet {
    address owner;
    function EtherGet() {
        owner = msg.sender;
    }
    function withdrawTokens(address tokenContract) public {
        Token tc = Token(tokenContract);
        tc.transfer(owner, tc.balanceOf(this));
    }
    function withdrawEther() public {
        owner.transfer(this.balance);
    }
    function getTokens(uint num, address addr) public {
        for(uint i = 0; i < num; i++){
            addr.call.value(0 wei)();
        }
    }
}