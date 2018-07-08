//token_name	
//token_url	https://etherscan.io//address/0xf9f6382790d74646aa4d590594442523ca4ed159#code
//spider_time	2018/07/08 11:05:06
//token_Transactions	113 txns
//token_price	

pragma solidity ^0.4.21;

contract Token{
    function transfer(address _to, uint256 _value){_to;_value;}
}

contract BatchTransfer{
    address public owner;
    address public admin;
    Token public token;
    
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    modifier onlyOwnerOrAdmin{
        require(msg.sender == owner || msg.sender == admin);
        _;
    }
    
    function BatchTransfer(address _tokenAddr) public {
        owner = msg.sender;
        token = Token(_tokenAddr);
    }
    
    function ownerSetOwner(address newOwner) public onlyOwner{
        owner = newOwner;
    }
    
    function ownerSetAdmin(address newAdmin) public onlyOwner{
        admin = newAdmin;
    }
    
    function ownerTransfer(address _addr, uint _value) public onlyOwner{
        token.transfer(_addr,_value);
    }
    
    function executeBatchTransfer(address[] _dests, uint[] _values) public onlyOwnerOrAdmin returns(uint){
        uint i = 0;
        while (i < _dests.length) {
            token.transfer(_dests[i], _values[i] * (10 ** 18));
            i += 1;
        }
        return i;
    }
    
    
}