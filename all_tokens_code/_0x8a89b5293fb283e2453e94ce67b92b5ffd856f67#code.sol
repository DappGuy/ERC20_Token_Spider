//token_name	
//token_url	https://etherscan.io//address/0x8a89b5293fb283e2453e94ce67b92b5ffd856f67#code
//spider_time	2018/07/08 11:10:30
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.24;

contract Wedding {
    string bride = "Taja";
    string groom = "Matej";
    string date = "29th July 2017";
    
    function getWeddingData() returns (string) {
        return string(abi.encodePacked(bride, " & ", groom, ", happily married on ", date, ". :)"));
    }
    
    function myWishes() returns (string) {
        return "May today be the beginning of a long, happy life together!";
    }
}