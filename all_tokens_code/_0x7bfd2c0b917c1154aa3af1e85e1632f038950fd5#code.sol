//token_name	
//token_url	https://etherscan.io//address/0x7bfd2c0b917c1154aa3af1e85e1632f038950fd5#code
//spider_time	2018/07/08 11:47:48
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.23;

interface ERC20 {
    function decimals() external view returns(uint);
}

contract GetDecimals {
    function getDecimals(ERC20 token) external view returns (uint){
        bytes memory data = abi.encodeWithSignature("decimals()");
        if(!address(token).call(data)) {
            // call failed
            return 18;
        }
        else {
            return token.decimals();
        }
    }
    
    function testRevert() public pure returns(string) {
        revert("ilan is the king");
        return "hello world";
    }
    
    function testRevertTx() public returns(string) {
        return testRevert();
    }    
}