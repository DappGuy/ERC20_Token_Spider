//token_name	
//token_url	https://etherscan.io//address/0xc7b1b50f5ce4fc99aed0235b7676bb5ef4014d8b#code
//spider_time	2018/07/08 11:38:41
//token_Transactions	13 txns
//token_price	

pragma solidity 0.4.24;

contract ERC20Interface {
    function transfer(address _to, uint _value) public returns (bool) {}
}

contract DropFunnel {
    
    ERC20Interface token = ERC20Interface(0x76cde978b24917a2797352591dF60E814d2B41B8);
    address owner = 0x53F64794758406C6e8355d22ee4d32926e75dCC6;
    uint dropAmount = 500000000000000000000;
  
	event PaymentFailure(
		address payee
	);

	function dropNectar(address[] receivers) public {
	    require(msg.sender == owner);
	    for (uint i = 0; i < receivers.length; i++){
	        if (!token.transfer(receivers[i],dropAmount)) {
	            emit PaymentFailure(receivers[i]);
	        }
	    }
	}
}