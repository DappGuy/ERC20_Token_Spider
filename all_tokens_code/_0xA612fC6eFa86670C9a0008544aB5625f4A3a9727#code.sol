//token_name	
//token_url	https://etherscan.io//address/0xA612fC6eFa86670C9a0008544aB5625f4A3a9727#code
//spider_time	2018/07/08 12:12:19
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.15;

contract EToken2Interface {
    function changeOwnership(bytes32 _symbol, address _newOwner) returns(bool);
}

contract TAAS {
    function recoverTokens(uint _value) returns(bool);
    function transfer(address _to, uint _value) returns(bool);
}

contract TAASOwner {
    TAAS public constant TAAS_CONTRACT = TAAS(0xE7775A6e9Bcf904eb39DA2b68c5efb4F9360e08C);
    EToken2Interface public constant ETOKEN2 = EToken2Interface(0x331d077518216c07C87f4f18bA64cd384c411F84);
    address public constant TAAS_VAULT = 0xecd7DA67e6563bbddfc2ddff9BA2632c721aF181;

    modifier onlyOwner() {
        require(msg.sender == TAAS_VAULT);
        _;
    }

    function recoverTokensTo(address _to, uint _value) onlyOwner public returns(bool) {
        require(TAAS_CONTRACT.recoverTokens(_value));
        require(TAAS_CONTRACT.transfer(_to, _value));
        return true;
    }

    function returnOwnership() onlyOwner public returns(bool) {
        require(ETOKEN2.changeOwnership('TAAS', TAAS_VAULT));
        return true;
    }
}