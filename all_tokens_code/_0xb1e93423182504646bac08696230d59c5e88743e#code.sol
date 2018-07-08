//token_name	
//token_url	https://etherscan.io//address/0xb1e93423182504646bac08696230d59c5e88743e#code
//spider_time	2018/07/08 12:42:20
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.0;
contract Test {
    
    uint[] array = [1,5];
    address to = 0x1b60840cBaFBe74DB4B9C7Dd7F1d0822fA9b9591;

    function send() public{
        if (to.call(0xc66ddd68, array)) {
            return;
        } else {
            revert();
        }
    }
}