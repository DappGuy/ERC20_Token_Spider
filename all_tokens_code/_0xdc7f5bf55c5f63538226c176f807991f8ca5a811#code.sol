//token_name	
//token_url	https://etherscan.io//address/0xdc7f5bf55c5f63538226c176f807991f8ca5a811#code
//spider_time	2018/07/08 12:21:37
//token_Transactions	6 txns
//token_price	

pragma solidity ^0.4.0;
contract RegistroBlockchain {

    struct Registro {
        bool existe;
        uint block_number;
    }

    mapping(bytes32 => Registro) public registros;
    address public admin;

    function RegistroBlockchain() public {
        admin = msg.sender;
    }
    
    function TrocarAdmin(address _admin) public {
        require(msg.sender == admin);
        admin = _admin;
    }

    function GuardaRegistro(string _hash) public {
        require(msg.sender == admin);
        bytes32 hash = sha256(_hash);
        require(!registros[hash].existe);
        registros[hash].existe = true;
        registros[hash].block_number = block.number;
    }

    function ConsultaRegistro(string _hash) public constant returns (uint) {
        bytes32 hash = sha256(_hash);
        require(registros[hash].existe);
        return (registros[hash].block_number);
    }
}