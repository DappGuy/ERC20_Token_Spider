//token_name	
//token_url	https://etherscan.io//address/0x471bd1ec14c3309404ba23eda9dbc7f09b51d050#code
//spider_time	2018/07/08 11:35:33
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.23;

// @author: Ghilia Weldesselasie
// An experiment in using contracts as public DBs on the blockchain

contract Database {

    address public owner;

    constructor() public {
      owner = msg.sender;
    }
    
    function withdraw() public {
      require(msg.sender == owner);
      owner.transfer(address(this).balance);
    }

    // Here the 'Table' event is treated as an SQL table
    // Each property is indexed and can be retrieved easily via web3.js
    event Table(uint256 indexed _row, string indexed _column, string indexed _value);
    /*
    _______
    |||Table|||
    -----------
    | row |    _column    |    _column2   |
    |  1  |    _value     |    _value     |
    |  2  |    _value     |    _value     |
    |  3  |    _value     |    _value     |
    */

    function put(uint256 _row, string _column, string _value) public {
        emit Table(_row, _column, _value);
    }
}