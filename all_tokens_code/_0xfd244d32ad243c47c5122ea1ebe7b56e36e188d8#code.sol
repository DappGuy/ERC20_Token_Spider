//token_name	
//token_url	https://etherscan.io//address/0xfd244d32ad243c47c5122ea1ebe7b56e36e188d8#code
//spider_time	2018/07/08 11:42:50
//token_Transactions	2 txns
//token_price	

pragma solidity 0.4.23;

contract Owned {
    address contractOwner;

    constructor() public { 
        contractOwner = msg.sender; 
    }
    
    function whoIsTheOwner() public view returns(address) {
        return contractOwner;
    }

    function changeOwner(address newOwner) public returns(bool) {
        require(newOwner != address(0));
        if (contractOwner == msg.sender) {
            contractOwner = newOwner;
            return true;
        }
        return false;
    }
}


contract Mortal is Owned  {
    function kill() public {
        if (msg.sender == contractOwner) selfdestruct(contractOwner);
    }
}

contract LivroVisitas is Mortal {
    mapping (address=>string) livro;

    function recordVisit(address visitor, string message) public returns(bool) {
        require(visitor != address(0));
        livro[visitor] = message;
        return true;
    }

    function getMessageOfVisit(address visitor) public view returns(string) {
        if (bytes(livro[visitor]).length > 1) {
            return livro[visitor];
        } else {
            return "";
        }
    }
}