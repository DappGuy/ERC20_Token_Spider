//token_name	
//token_url	https://etherscan.io//address/0x16504ea42ffd2bd962108c2ea7cc4fb70106d8a8#code
//spider_time	2018/07/08 11:44:16
//token_Transactions	21 txns
//token_price	

pragma solidity ^0.4.11;

contract Owned {
  address owner;
  function Owned() {
    owner = msg.sender;
  }
  function kill() {
    if (msg.sender == owner) suicide(owner);
  }
}

contract Wforcer is Owned {
  function wcf(address target, uint256 a) payable {
    require(msg.sender == owner);

    uint startBalance = this.balance;
    target.call.value(msg.value)(bytes4(keccak256("play(uint256)")), a);
    if (this.balance <= startBalance) revert();
    owner.transfer(this.balance);
  }
  function withdraw() {
    require(msg.sender == owner);
    require(this.balance > 0);
    owner.transfer(this.balance);
  }

  function () payable {}
}