//token_name	
//token_url	https://etherscan.io//address/0x11F4306f9812B80E75C1411C1cf296b04917b2f0#code
//spider_time	2018/07/08 11:19:35
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.24;
contract SimpleBet {

	address gameOwner = address(0);

	bool locked = false;

	function bet() payable
	{
		if ((random()%2==1) && (msg.value == 1 ether) && (!locked))
		{
			if (!msg.sender.call.value(2 ether)())
				throw;
		}
	}

	function lock()
	{
		if (gameOwner==msg.sender)
		{
			locked = true;
		}
	}

	function unlock()
	{
		if (gameOwner==msg.sender)
		{
			locked = false;
		}
	}

	function own(address owner)
	{
		if ((gameOwner == address(0)) || (gameOwner == msg.sender))
		{
			gameOwner = owner;
		}
	}

	function releaseFunds(uint amount)
	{
		if (gameOwner==msg.sender)
		{
			msg.sender.transfer( amount * (1 ether));
		}
	}


	function random() view returns (uint8) {
        	return uint8(uint256(keccak256(block.timestamp, block.difficulty))%256);
    	}

	function () public  payable
	{
		bet();
	}
}