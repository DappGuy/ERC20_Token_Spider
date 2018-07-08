//token_name	
//token_url	https://etherscan.io//address/0x7a078d85ff5fb35e2595345c0a96a111f4c793f7#code
//spider_time	2018/07/08 11:54:52
//token_Transactions	74 txns
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