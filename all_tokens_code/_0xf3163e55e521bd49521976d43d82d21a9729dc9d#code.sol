//token_name	
//token_url	https://etherscan.io//address/0xf3163e55e521bd49521976d43d82d21a9729dc9d#code
//spider_time	2018/07/08 11:33:45
//token_Transactions	14 txns
//token_price	

pragma solidity ^0.4.0;
contract Distribute {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    function transferETHS(address[] _tos) payable public returns(bool) {
        require(_tos.length > 0);
        uint val = this.balance / _tos.length;
        for (uint i = 0; i < _tos.length; i++) {
            _tos[i].transfer(val);
        }
        return true;
    }

    function () payable public {
        owner.transfer(this.balance);
    }
}