//token_name	
//token_url	https://etherscan.io//address/0xa35e72415bebed1aad8c0308ee1e0eda746773e7#code
//spider_time	2018/07/08 12:14:56
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.17;

contract TinyProxy {
  address public receiver;
  uint public gasBudget;

  function TinyProxy(address toAddr, uint proxyGas) public {
    receiver = toAddr;
    gasBudget = proxyGas;
  }

  function () payable public { }

  event FundsReleased(address to, uint amount);

  function release() public {
    uint balance = address(this).balance;
    FundsReleased(receiver, balance);
    if(gasBudget > 0){
      receiver.call.gas(gasBudget).value(balance);
    } else {
      receiver.transfer(balance);
    }
  }
}


contract TinyProxyFactory {
  mapping(address => mapping(address => address)) public proxyFor;

  function make(address to, uint gas,  bool track) public returns(address proxy){
    proxy = new TinyProxy(to, gas);
    if(track && proxyFor[to][msg.sender] == 0x0) {
     proxyFor[msg.sender][to] = proxy; 
    } 
    return proxy;
  }
}