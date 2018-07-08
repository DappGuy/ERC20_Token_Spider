//token_name	
//token_url	https://etherscan.io//address/0xff77264bb6899aaeae39bb41d710cdef189e2f3c#code
//spider_time	2018/07/08 11:21:57
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.22;

contract ComplianceService {
	function validate(address _from, address _to, uint256 _amount) public returns (bool allowed) {
		return true;
	}
}