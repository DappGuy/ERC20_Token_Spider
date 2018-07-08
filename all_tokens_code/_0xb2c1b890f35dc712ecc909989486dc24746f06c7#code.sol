//token_name	
//token_url	https://etherscan.io//address/0xb2c1b890f35dc712ecc909989486dc24746f06c7#code
//spider_time	2018/07/08 11:17:21
//token_Transactions	1 txn
//token_price	

contract proofofpower {
    
    bytes[6] public whitepaper;
    uint counter;
    function uploadData(bytes _data) public returns (uint){
        whitepaper[counter] = _data;
        counter++;
    }
}