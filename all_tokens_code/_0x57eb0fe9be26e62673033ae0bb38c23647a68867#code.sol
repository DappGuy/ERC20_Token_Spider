//token_name	
//token_url	https://etherscan.io//address/0x57eb0fe9be26e62673033ae0bb38c23647a68867#code
//spider_time	2018/07/08 11:26:25
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.24;

contract SaiVox {
    function par() public returns (uint);
    function way() public returns (uint);
}

contract GetSaiVoxValues {
    SaiVox public saiVox = SaiVox(0x9B0F70Df76165442ca6092939132bBAEA77f2d7A);

    uint public par;
    uint public way;

    function update() public {
        par = saiVox.par();
        way = saiVox.way();
    }
}