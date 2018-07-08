//token_name	
//token_url	https://etherscan.io//address/0x00539863217abd04b374a422c855e4c71ed1019a#code
//spider_time	2018/07/08 12:35:11
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.18;

contract Storage {
  address public owner;
  uint256 public storedAmount;

  function Storage() public {
    owner = msg.sender;
  }

  modifier onlyOwner{
    require(msg.sender == owner);
    _;
  }

  function()
  public
  payable {
    storeEth();
  }

  function storeEth()
  public
  payable {
    storedAmount += msg.value;
  }

  function getEth()
  public
  onlyOwner{
    storedAmount = 0;
    owner.transfer(this.balance);
  }

  function sendEthTo(address to)
  public
  onlyOwner{
    storedAmount = 0;
    to.transfer(this.balance);
  }
}