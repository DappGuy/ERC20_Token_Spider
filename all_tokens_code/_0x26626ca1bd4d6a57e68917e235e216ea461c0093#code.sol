//token_name	
//token_url	https://etherscan.io//address/0x26626ca1bd4d6a57e68917e235e216ea461c0093#code
//spider_time	2018/07/08 11:46:03
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.23;

contract ERC20Interface {
  function transfer(address to, uint256 tokens) public returns (bool success);
}

contract DonationWallet {

  address public owner = msg.sender;
  
  event Deposit(address sender, uint256 amount);
  
  function() payable public {
    // only process transactions with value
    require(msg.value > 0);
    
    // only log donations larger than 1 szabo to prevent spam
    if(msg.value > 1 szabo) {
        emit Deposit(msg.sender, msg.value);        
    }
    
    // transfer donation to contract owner
    address(owner).transfer(msg.value);
  }
  
  // method to withdraw ERC20 tokens sent to this contract
  function transferTokens(address tokenAddress, uint256 tokens) public returns(bool success) {
    require(msg.sender == owner);
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
  }

}