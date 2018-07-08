//token_name	
//token_url	https://etherscan.io//address/0xe1efc1c66584dcb5f18f42aad7565c8d60bcb352#code
//spider_time	2018/07/08 12:27:06
//token_Transactions	1 txn
//token_price	

/**
 *  @title Griefing
 *  @author Cl�ment Lesaege - <clement@lesaege.com>
 *  This is a contract to illustrate griefing opportunities.
 *  If someone sends griefCost to the contract, the ether in it will be burnt.
 *  The owner can get the ether back if no one burnt his ethers.
 */
pragma solidity ^0.4.18;

contract Griefing {
    uint public griefCost;
    address public owner;
    
    /** @dev Constructor.
     *  @param _griefCost The amount the griefer have to pay to destroy the ethers in the contract.
     */
    function Griefing(uint _griefCost) public payable {
        griefCost=_griefCost;
        owner=msg.sender;
    }
    
    /** @dev Pay griefCost in order to burn the ethers inside the contract.
     */
    function () public payable {
        require(msg.value==griefCost);
        address(0x0).send(this.balance);
    }
    
    /** @dev Get your ethers back (if no one has paid the griefCost).
     */
    function getBack() public {
        require(msg.sender==owner);
        msg.sender.send(this.balance);
    }
    
}