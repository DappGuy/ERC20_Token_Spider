//token_name	
//token_url	https://etherscan.io//address/0x69bc8ce0ca03d6874f3a84732b5dea5ed5b8a6a3#code
//spider_time	2018/07/08 11:12:06
//token_Transactions	1 txn
//token_price	

contract ERC20 {
  function transfer(address _recipient, uint256 _value) public returns (bool success);
}

contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

contract Airdrop is Ownable {
    
  function distributeBulk(ERC20 token, address[] recipients, uint256[] values) onlyOwner public {
    for (uint256 i = 0; i < recipients.length; i++) {
      token.transfer(recipients[i], values[i]);
    }
  }
  
  function distribute(ERC20 token, address recipient, uint256 value) onlyOwner public {
      token.transfer(recipient, value);
  }
}