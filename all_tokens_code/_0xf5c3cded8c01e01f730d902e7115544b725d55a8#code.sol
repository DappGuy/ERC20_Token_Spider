//token_name	
//token_url	https://etherscan.io//address/0xf5c3cded8c01e01f730d902e7115544b725d55a8#code
//spider_time	2018/07/08 12:36:20
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.17;

contract Random {
	uint256 lastTimeBlockNumber;
	event Generate(
		address indexed _fromIndex,
		address _from,
		uint256 maxValue,
		uint256 result
	);	

	function random(uint256 maxValue) public returns (uint256 randomNumber) {
		require(maxValue > 0);
		require(lastTimeBlockNumber != block.number);
		lastTimeBlockNumber = block.number;
		uint256 result = uint256(keccak256(block.blockhash(block.number - 1), block.coinbase, block.difficulty));
		result = result % maxValue + 1;
		Generate(msg.sender,msg.sender, maxValue, result);
		return result;
	}
}