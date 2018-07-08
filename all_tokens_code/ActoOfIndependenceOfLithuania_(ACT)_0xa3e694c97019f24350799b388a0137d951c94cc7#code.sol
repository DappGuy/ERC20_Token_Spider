//token_name	ActoOfIndependenceOfLithuania_(ACT)
//token_url	https://etherscan.io//address/0xa3e694c97019f24350799b388a0137d951c94cc7#code
//spider_time	2018/07/08 11:05:16
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.21;


contract Act {

    bytes32 public symbol;
    bytes32 public  name;
    string public act = "QmbQepVoQdawBcz8A98nApTH5SaFGHqK6pTKi2eYK3DvAm";

    function Act() public {
        symbol = "ACT";
        name = "ActoOfIndependenceOfLithuania";
    }

    function getAct() public view returns (string) {
        return act;
    }

}