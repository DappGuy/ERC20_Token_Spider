//token_name	
//token_url	https://etherscan.io//address/0xd532550b23b5a9ac9a230280518818f209db95d1#code
//spider_time	2018/07/08 12:26:31
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.18;
contract BlockmaticsGraduationCertificate_030518 {
    address public owner = msg.sender;
    string public certificate;
    bool public certIssued = false;

    function publishGraduatingClass (string cert) public {
        assert (msg.sender == owner && !certIssued);

        certIssued = true;
        certificate = cert;
    }
}