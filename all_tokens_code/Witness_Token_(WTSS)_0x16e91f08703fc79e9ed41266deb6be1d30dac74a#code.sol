//token_name	Witness_Token_(WTSS)
//token_url	https://etherscan.io//address/0x16e91f08703fc79e9ed41266deb6be1d30dac74a#code
//spider_time	2018/07/08 11:41:11
//token_Transactions	1510 txns
//token_price	

pragma solidity ^0.4.15;

contract MyOwned {
    address public owner;
    function MyOwned() public { owner = msg.sender; }
    modifier onlyOwner { require(msg.sender == owner ); _; }
    function transferOwnership(address newOwner) onlyOwner public { owner = newOwner; }
}

interface recipient { 
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; 
}

contract MyToken is MyOwned {   
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    
    mapping (address => uint256) public balanceOf;
    mapping (address => bool) public frozenAccount;
    event FrozenFunds(address target,bool frozen);
    event Transfer(address indexed from,address indexed to,uint256 value);
    

    function MyToken(uint256 initialSupply,string tokenName,string tokenSymbol,uint8 decimalUnits){
        balanceOf[msg.sender] = initialSupply;
        totalSupply = initialSupply;
        name = tokenName;
        symbol = tokenSymbol;
        decimals = decimalUnits;
    }

    function freezeAccount(address target,bool freeze) onlyOwner {
        frozenAccount[target] = freeze;
        FrozenFunds(target, freeze);
    }

    function transfer(address _to, uint256 _value){
        require(!frozenAccount[msg.sender]);
        require (balanceOf[msg.sender] >= _value);
        require (balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value);
    }
        function mintToken(address target, uint256 mintedAmount) onlyOwner {
        balanceOf[target] += mintedAmount;
        Transfer(0, this, mintedAmount);
        Transfer(this, target, mintedAmount);
    }
}