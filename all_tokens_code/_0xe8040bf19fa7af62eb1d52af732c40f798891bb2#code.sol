//token_name	
//token_url	https://etherscan.io//address/0xe8040bf19fa7af62eb1d52af732c40f798891bb2#code
//spider_time	2018/07/08 11:36:16
//token_Transactions	13 txns
//token_price	

pragma solidity ^0.4.23;

interface TokenContract {
  function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
}

contract Airdrop {
  address public owner;
  bool public isTheContract = true;

  constructor() public {
  
    owner = msg.sender;
  }

  function sendTokens(address[] addresses, uint256[] _amount, address _tokenAddress) public {
    //require(msg.sender == owner);
    uint256 addressCount = addresses.length;
    uint256 amountCount = _amount.length;
    require(addressCount == amountCount);
    TokenContract tkn = TokenContract(_tokenAddress);
    for (uint256 i = 0; i < addressCount; i++) {
      tkn.transferFrom(msg.sender, addresses[i], _amount[i]);
    }
  }

  function destroyMe() public {
    require(msg.sender == owner);
    selfdestruct(owner);
  }
    
}