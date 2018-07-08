//token_name	
//token_url	https://etherscan.io//address/0xa86e4aeddf4336940e17d524000f1a0cef7c1fe9#code
//spider_time	2018/07/08 12:28:51
//token_Transactions	3 txns
//token_price	

contract TestRevert {
    
    function revertMe() {
        require(false);
    }
    
    function throwMe() {
        throw;
    }
}