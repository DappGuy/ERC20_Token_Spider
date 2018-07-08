//token_name	
//token_url	https://etherscan.io//address/0xbaaffc2f4074863bf0ced1dc61e5410fad075cec#code
//spider_time	2018/07/08 12:53:21
//token_Transactions	3 txns
//token_price	

// sendlimiter
// limit funds held on a contract
// @authors:
// Cody Burns <dontpanic@codywburns.com>
// license: Apache 2.0
// version:

pragma solidity ^0.4.19;

// Intended use:  
// cross deploy to limit funds on a chin identifier
// Status: functional
// still needs:
// submit pr and issues to https://github.com/realcodywburns/
//version 0.1.0


contract sendlimiter{
 function () public payable {
     require(this.balance + msg.value < 100000000);}
}