//token_name	
//token_url	https://etherscan.io//address/0x3efb2bbdf798c5f9fe0dd932846fa1b031eac1fe#code
//spider_time	2018/07/08 12:39:56
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.0;

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

  function Ownable () public {owner = msg.sender;

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



contract token {function transfer (address receiver, uint _amount) public { } }



contract Distribute is Ownable{

  

    token tokenReward = token(0xdd007278B667F6bef52fD0a4c23604aA1f96039a);



  function register(address[] _addrs) public onlyOwner{

    for(uint i = 0; i < _addrs.length; ++i){

      tokenReward.transfer(_addrs[i],20*10**8);

    }

  }



  function withdraw(uint _amount) public onlyOwner {

    tokenReward.transfer(owner,_amount);

  }

}