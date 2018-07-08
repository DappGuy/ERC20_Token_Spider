//token_name	
//token_url	https://etherscan.io//address/0xb0365d6e0af52bf71f18069c16b9d1f6b935d39b#code
//spider_time	2018/07/08 11:15:36
//token_Transactions	25 txns
//token_price	

contract SaveData{
    constructor() public {
    }
    mapping (string=>string) data;
    function setStr(string key, string value) public payable {
        data[key] = value;
    }
    function getStr(string key) public constant returns(string){
        return data[key];
    }
}