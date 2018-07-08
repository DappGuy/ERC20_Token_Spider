//token_name	
//token_url	https://etherscan.io//address/0x4741f3a19196740af562cdd4274dcaf273e45480#code
//spider_time	2018/07/08 11:56:27
//token_Transactions	28 txns
//token_price	

pragma solidity ^0.4.21;
contract RegistroBlockchain {

    struct Registro {
        bool existe;
        uint block_number;
    }

    mapping(bytes32 => Registro) public registros;
    address public admin;

    constructor() public {
        admin = msg.sender;
    }
    
    function TrocarAdmin(address _admin) public {
        require(msg.sender == admin);
        admin = _admin;
    }

    function GuardaRegistro(bytes32 hash) public {
        require(msg.sender == admin);
        if (!registros[hash].existe) {
            registros[hash].existe = true;
            registros[hash].block_number = block.number;
        }
    }

    function ConsultaRegistro(bytes32 hash) public constant returns (uint) {
        require(registros[hash].existe);
        return (registros[hash].block_number);
    }
}