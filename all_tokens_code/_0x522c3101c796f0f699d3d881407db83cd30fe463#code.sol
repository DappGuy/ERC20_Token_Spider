//token_name	
//token_url	https://etherscan.io//address/0x522c3101c796f0f699d3d881407db83cd30fe463#code
//spider_time	2018/07/08 11:19:42
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.23;

contract DAppsDevs {
    address public owner;

    string public constant companyName = "DApps Devs LLC";
    string public constant companySite = "dappsdevs.io, dappsdevs.com";
    string public constant phoneNumber  = "+1-302-481-9195";
    string public constant email = "info@dappsdevs.com";

    mapping(bytes32 => string) public additionalInfo;

    constructor() public {
        owner = msg.sender;
    }

    function () payable fromOwner() {
    }

    function setCompanyInfo(bytes32 key, string value) fromOwner() public {
        additionalInfo[key] = value;
    }

    function getCompanyInfo(bytes32 key) constant public returns (string) {
        return additionalInfo[key];
    }

    function kill() fromOwner() public {
        selfdestruct(owner);
    }

    modifier fromOwner() {
        require(owner == msg.sender);
        _;
    }
}