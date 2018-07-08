//token_name	
//token_url	https://etherscan.io//address/0x8cc926f5bd83a420e127d80ee2874c22aa368b14#code
//spider_time	2018/07/08 12:02:28
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.18;

contract ZperMainSale {

	uint256 public totalContributed;
	uint256 public startTime;
	uint256 public endTime;
	uint256 public hardCap;
	address public owner;

	function ZperMainSale (address _owner, uint256 _start, uint256 _end, uint256 _cap) public {
		owner = _owner;
		startTime = _start;
		endTime = _end;
		hardCap = _cap * (10 ** 18);
	}

	function () external payable {
		require(now >= startTime && now <= endTime);
		require(hardCap >= msg.value + totalContributed);
		require(msg.value >= 10 ** 17);
		totalContributed += msg.value;
	}

	modifier onlyOwner() {
		assert(msg.sender == owner);
		_;
	}

	function forwardFunds(address _to, uint256 _value) onlyOwner public returns (bool success) {
		require(_to != address(0));
		_to.transfer(_value);
		return true;
	}

}