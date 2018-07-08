//token_name	
//token_url	https://etherscan.io//address/0x3127be52acba38beab6b4b3a406dc04e557c037c#code
//spider_time	2018/07/08 11:48:17
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.20;

contract PLATPriceOracle {

  mapping (address => bool) admins;

  // How much PLAT you get for 1 ETH, multiplied by 10^18
  uint256 public ETHPrice = 60000000000000000000000;

  event PriceChanged(uint256 newPrice);

  constructor() public {
    admins[msg.sender] = true;
  }

  function updatePrice(uint256 _newPrice) public {
    require(_newPrice > 0);
    require(admins[msg.sender] == true);
    ETHPrice = _newPrice;
    emit PriceChanged(_newPrice);
  }

  function setAdmin(address _newAdmin, bool _value) public {
    require(admins[msg.sender] == true);
    admins[_newAdmin] = _value;
  }
}