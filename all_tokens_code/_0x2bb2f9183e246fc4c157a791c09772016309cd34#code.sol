//token_name	
//token_url	https://etherscan.io//address/0x2bb2f9183e246fc4c157a791c09772016309cd34#code
//spider_time	2018/07/08 12:49:17
//token_Transactions	1 txn
//token_price	

contract Zhtong {
    address public owner;
      uint private result;
      function Set(){
          owner = msg.sender;
      }
      function assign(uint x, uint y) returns (uint){
          result = x + y;
      }
}