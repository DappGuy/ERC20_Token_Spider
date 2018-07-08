//token_name	
//token_url	https://etherscan.io//address/0xb4d735c011a492d180edcdcfab25420a6bfbed96#code
//spider_time	2018/07/08 12:09:42
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.21;

  contract MBLToken {
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function balanceOf(address _tokenOwner) external view returns (uint balance);

 }

   contract passOnContract {

    address public owner;
  	address public tokenAddress = 0x8D7dDaD45789a64c2AF9b4Ce031C774e277F1Cd4;

  	function passOnContract() public {

  		owner = msg.sender;
  	}

    function () public payable {

    	owner.transfer(msg.value);
    	MBLToken mblToken = MBLToken(tokenAddress);
    	mblToken.transferFrom(owner, msg.sender, msg.value/250000000000000);

    }

}