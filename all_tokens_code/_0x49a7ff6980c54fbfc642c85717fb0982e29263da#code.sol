//token_name	
//token_url	https://etherscan.io//address/0x49a7ff6980c54fbfc642c85717fb0982e29263da#code
//spider_time	2018/07/08 11:12:26
//token_Transactions	1 txn
//token_price	

contract GetTest{
    uint a = 1;
    string b = "b";
    address c;
    constructor() public {
        c = msg.sender;
    }
    function getOne() public constant returns(uint) {
        return a;
    }
    function getTwo() public constant returns(uint, string){
        return (a, b);
    }
    function getThree() public constant returns (uint, string, address){
        return (a, b, c);
    }
}