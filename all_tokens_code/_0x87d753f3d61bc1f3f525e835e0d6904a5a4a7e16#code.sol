//token_name	
//token_url	https://etherscan.io//address/0x87d753f3d61bc1f3f525e835e0d6904a5a4a7e16#code
//spider_time	2018/07/08 12:48:07
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.16;

contract test
{
    event AAA(address indexed sender, uint x);
    
    function aaa(bytes data) public
    {
        uint x = _bytesToUint(data);
        AAA(msg.sender, x);
    }
    
    function _bytesToUint(bytes data) internal view returns (uint) {
        uint num = 0;
        for(uint i = 0; i < data.length; i++) {
            num += uint(data[i]);
            if(i != data.length - 1)
                num *= 256;
        }
        return num;
    }
}