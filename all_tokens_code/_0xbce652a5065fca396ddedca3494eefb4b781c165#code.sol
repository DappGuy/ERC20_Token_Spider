//token_name	
//token_url	https://etherscan.io//address/0xbce652a5065fca396ddedca3494eefb4b781c165#code
//spider_time	2018/07/08 12:22:18
//token_Transactions	5 txns
//token_price	

/*
 * DO NOT EDIT! DO NOT EDIT! DO NOT EDIT!
 *
 * This is an automatically generated file. It will be overwritten.
 *
 * For the original source see
 *    '/Users/swaldman/Dropbox/BaseFolders/development-why/gitproj/eth-fortune/src/main/solidity/Fortune.sol'
 */

pragma solidity ^0.4.10;





contract Fortune {
  string[] private fortunes;

  function Fortune( string initialFortune ) public {
    addFortune( initialFortune );
  }

  function addFortune( string fortune ) public {
    fortunes.push( fortune );

    FortuneAdded( msg.sender, fortune );
  }

  function drawFortune() public constant returns ( string fortune ) {
    fortune = fortunes[ shittyRandom() % fortunes.length ];
  }

  function shittyRandom() private constant returns ( uint number ) {
    number = uint( block.blockhash( block.number - 1 ) );  	   
  }

  event FortuneAdded( address author, string fortune );	
}