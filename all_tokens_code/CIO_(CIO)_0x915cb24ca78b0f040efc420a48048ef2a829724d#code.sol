//token_name	CIO_(CIO)
//token_url	https://etherscan.io//address/0x915cb24ca78b0f040efc420a48048ef2a829724d#code
//spider_time	2018/07/08 11:55:04
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.21;

contract CioCoinERC20Token {
  address public owner;
  string public name;
  string public symbol;
  uint public decimals;
  uint256 public totalSupply;
  event Transfer(address indexed from, address indexed to, uint256 value);
  mapping (address => uint256) public balanceOf;
  
  function CioCoinERC20Token(uint256 initialSupply, string tokenName, string tokenSymbol, uint decimalUnits) public {
    owner = msg.sender;
    totalSupply = initialSupply * 10 ** uint256(decimals);
    balanceOf[msg.sender] = totalSupply;
    name = tokenName;
    symbol = tokenSymbol;
    decimals = decimalUnits;
  }

  function transfer(address _to, uint256 _value) public {
    require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
  }
}