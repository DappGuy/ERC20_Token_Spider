//token_name	
//token_url	https://etherscan.io//address/0x588d35ab444fdef6b0107f472e61327d65ba7058#code
//spider_time	2018/07/08 11:17:14
//token_Transactions	1 txn
//token_price	

contract Destructible {

/**
* @dev mapping of security => (investorEthAddress, investerInfo)
*/
    address _owner; //owner of this contract

 /*
 * event emitted when ethers received in this contract
 */
    event receipt(address indexed investor, uint value);

/**
* @dev Modifier to make a function callable only by the owner of the contract
*/
    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

  /**
   * @dev Constructor of the Destructible
   */ 
    constructor() public {
        _owner = msg.sender;
    }

    /**
    * @dev 
    * Payable fallback function. 
    * Function just emits event to be inline with 2300 gas limitation for fallback functions
    */
    function() payable public {
        emit receipt(msg.sender, msg.value);
    }
       
    /**
    * @dev 
    * destroyAndSend 
    * @param _recipient is the recipient address to which fund held by this contract are to be remitted on selfdestruction
    */

    function destroyAndSend(address _recipient) onlyOwner() public {
        selfdestruct(_recipient);
    }

}