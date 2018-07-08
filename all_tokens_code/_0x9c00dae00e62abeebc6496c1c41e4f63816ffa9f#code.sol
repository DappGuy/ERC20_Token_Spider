//token_name	
//token_url	https://etherscan.io//address/0x9c00dae00e62abeebc6496c1c41e4f63816ffa9f#code
//spider_time	2018/07/08 12:33:42
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.5;
contract BlockmaticsGraduationCertificate_022218 {
    address public owner = msg.sender;
    string public certificate;
    bool public certIssued = false;

    function publishGraduatingClass(string cert) public {
        require (msg.sender == owner && !certIssued);
        certIssued = true;
        certificate = cert;
    }
}