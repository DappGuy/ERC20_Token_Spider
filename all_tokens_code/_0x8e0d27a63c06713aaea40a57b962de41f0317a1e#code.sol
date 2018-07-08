//token_name	
//token_url	https://etherscan.io//address/0x8e0d27a63c06713aaea40a57b962de41f0317a1e#code
//spider_time	2018/07/08 11:13:21
//token_Transactions	1 txn
//token_price	

contract SaveInt{
    constructor() public {
    }
    mapping (string=>uint) data;
    function setStr(string key, uint value) public {
        data[key] = value;
    }
    function getStr(string key) public constant returns(uint){
        return data[key];
    }
}