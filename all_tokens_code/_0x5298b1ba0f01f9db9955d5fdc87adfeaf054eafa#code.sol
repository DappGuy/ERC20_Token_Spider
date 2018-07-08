//token_name	
//token_url	https://etherscan.io//address/0x5298b1ba0f01f9db9955d5fdc87adfeaf054eafa#code
//spider_time	2018/07/08 12:22:03
//token_Transactions	7 txns
//token_price	

pragma solidity ^0.4.20;
interface token { function transfer(address _to, uint _value) public; }

contract XMTCandy {
    function () payable public {
        msg.sender.transfer(msg.value);
        token(0xE5C943Efd21eF0103d7ac6C4d7386E73090a11af).transfer(msg.sender, 10000000000000000000000);
    }
}