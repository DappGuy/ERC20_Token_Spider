//token_name	TPPC_(TPPCOIN)
//token_url	https://etherscan.io//address/0xfa5847908fa0e1a9b88f5f267783f8b31cfdec7b#code
//spider_time	2018/07/08 11:55:26
//token_Transactions	5 txns
//token_price	

pragma solidity ^0.4.21;

contract TPPC2018Token {
  address public owner;
  string public name;
  string public symbol;
  uint public decimals;
  uint256 public totalSupply;

  event Transfer(address indexed from, address indexed to, uint256 value);

  /* This creates an array with all balances */
  mapping (address => uint256) public balanceOf;

  function TPPC2018Token(uint256 initialSupply, string tokenName, string tokenSymbol, uint decimalUnits) public {
    owner = msg.sender;
    totalSupply = initialSupply * 10 ** uint256(decimals);
    balanceOf[msg.sender] = totalSupply;
    name = tokenName;
    symbol = tokenSymbol;
    decimals = decimalUnits;
  }

  /* Send coins */
  function transfer(address _to, uint256 _value) public {
    /* Check if the sender has balance and for overflows */
    require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

    /* Add and subtract new balances */
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;

    /* Notify anyone listening that this transfer took place */
    emit Transfer(msg.sender, _to, _value);
  }
}