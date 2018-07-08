//token_name	
//token_url	https://etherscan.io//address/0x5c8266fbf78977e8b3c3fcc96cdd3cc21133ff9e#code
//spider_time	2018/07/08 11:12:25
//token_Transactions	1 txn
//token_price	

contract ERC20 {
    mapping(address => uint) public balanceOf;
}


contract balanceChecker {
    function checkBals(ERC20 _location, address[] addrs) public view returns(uint[]) {
        uint[] memory bals = new uint[](addrs.length);
        for (uint i=0; i < addrs.length; i++) {
            bals[i] = _location.balanceOf(addrs[i]);
        }
        return bals;
    }
}