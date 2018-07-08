//token_name	
//token_url	https://etherscan.io//address/0x7b68db88fd49062de18d32df9ad9a46475bac37d#code
//spider_time	2018/07/08 12:27:22
//token_Transactions	35 txns
//token_price	

pragma solidity 0.4.20;

contract ETHDistributor {
    
  address public owner;
    
  function ETHDistributor() public {
    owner = msg.sender;
  }
   
  function addReceivers(address[] receivers, uint[] balances) public {
    require(msg.sender == owner);
    for(uint i = 0; i < receivers.length; i++) {
      receivers[i].transfer(balances[i]);
    }
  } 
  
  function refund() public {
    require(msg.sender == owner);      
    owner.transfer(this.balance);
  }

  function () public payable {
  }

}