//token_name	
//token_url	https://etherscan.io//address/0x02878a096847c755049abc937e84ae8f49b69285#code
//spider_time	2018/07/08 11:32:46
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.24;

contract Ownable {
    address public owner;

    constructor () public {
        owner = 0xCfBbef59AC2620271d8C8163a294A04f0b31Ef3f;
    }

     modifier onlyOwner() {
    if (msg.sender != owner) {
      revert();
    }
    _;
}

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }
}

contract TokenERC20 {
  function transfer(address _to, uint256 _value) public;
}

contract CaruTokenSender is Ownable {

    function drop(TokenERC20 token, address[] to, uint256[] value) onlyOwner public {
    for (uint256 i = 0; i < to.length; i++) {
      token.transfer(to[i], value[i]);
    }
  }
}