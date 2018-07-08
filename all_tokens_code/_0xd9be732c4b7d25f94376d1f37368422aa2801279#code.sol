//token_name	
//token_url	https://etherscan.io//address/0xd9be732c4b7d25f94376d1f37368422aa2801279#code
//spider_time	2018/07/08 11:58:29
//token_Transactions	22 txns
//token_price	

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;
 

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() {
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
  function transferOwnership(address newOwner) onlyOwner public {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}


contract DistributeETH is Ownable{
  

  function distributeFixed(address[] _addrs, uint _amoutToEach) onlyOwner{
    for(uint i = 0; i < _addrs.length; ++i){
      if(!_addrs[i].send(_amoutToEach)) throw;
    }
  }

  function () payable {}

}