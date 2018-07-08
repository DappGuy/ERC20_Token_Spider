//token_name	
//token_url	https://etherscan.io//address/0x7bb931911eda807b2f5636230808ccbc69fcc001#code
//spider_time	2018/07/08 12:16:00
//token_Transactions	1 txn
//token_price	

/**
 * Verify seeds and results when playing Dice on Edgeless Casino.
 * author: Julia Altenried
 **/

pragma solidity ^0.4.21;
contract Dice{
  /**
   * check if the hashed seed was derived from the revealed seed
   * @param seed     the plain srvSeed
   *        seedHash the hash of the seed
   * @return true if correct
   **/
  function verifySeed(bytes32 seed, bytes32 seedHash) pure public returns (bool correct){
    return keccak256(seed) == seedHash;
  }
  
  /**
   * check if num/loss was paid as expected
   * @param bet       the bet in EDG with decimals
   *        number    the rolled number
   *        limit     the limit to roll below or above
   *        rollBelow true if the player has to roll below the limit in order to win
   * @return the win and loss 
   * */
  function determineOutcome(uint bet, uint number, uint limit, bool rollBelow) public pure returns(uint win, uint loss){
    require(limit > 0 && limit <= 999);
    if(rollBelow && number < limit){//win
      win = bet*1000/limit - bet;
    }
    else if(!rollBelow && number > limit){//win
      win = bet*1000/(1000-limit) - bet;
    }
    else{//loss
      loss = bet;
    }
  }
}