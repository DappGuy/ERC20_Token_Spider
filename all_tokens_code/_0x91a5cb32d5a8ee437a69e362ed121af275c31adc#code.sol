//token_name	
//token_url	https://etherscan.io//address/0x91a5cb32d5a8ee437a69e362ed121af275c31adc#code
//spider_time	2018/07/08 11:13:19
//token_Transactions	20 txns
//token_price	

contract SaveString{
    constructor() public {
    }
    mapping (uint=>string) data;
    function setStr(uint key, string value) public {
        data[key] = value;
    }
    function getStr(uint key) public constant returns(string){
        return data[key];
    }
}