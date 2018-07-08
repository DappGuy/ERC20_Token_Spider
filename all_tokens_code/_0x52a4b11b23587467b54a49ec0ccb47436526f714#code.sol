//token_name	
//token_url	https://etherscan.io//address/0x52a4b11b23587467b54a49ec0ccb47436526f714#code
//spider_time	2018/07/08 11:59:24
//token_Transactions	5 txns
//token_price	

pragma solidity ^0.4.21;

contract DoacaoEvento {
    address public responsavel;
    enum StatusDoacao{ABERTO, FECHADO, SACADO}
    StatusDoacao public statusDoacao;
    address public ong;
    
    Doador[] public doadores;  
    
    event LogDoacaoRecebida(address doador, uint256 value);
    event LogSaqueEfetuado(uint dataHora);
    event LogOngInformada(address doador);
     
    struct Doador {
        address doador;
        uint256 valor;
        uint256 dataHora;
    }
    
    function DoacaoEvento() public {
        responsavel = msg.sender;
        statusDoacao = StatusDoacao.ABERTO;
    }
    
    modifier apenasResponsavel() {
        require(msg.sender == responsavel);
        _;
    }

    function informarOng(address _ong) public apenasResponsavel {
        emit LogOngInformada(_ong);
        ong = _ong;
    }
    
    function fecharDoacoes() public apenasResponsavel {
        require(statusDoacao == StatusDoacao.ABERTO);
        statusDoacao = StatusDoacao.FECHADO;
    }
    
    function abrirDoacoes() public apenasResponsavel {
        statusDoacao = StatusDoacao.ABERTO;
    }  
    
    function sacarDoacoes() public {
        require(msg.sender == ong && address(this).balance > 0 && statusDoacao == StatusDoacao.FECHADO);
        statusDoacao = StatusDoacao.SACADO;
        emit LogSaqueEfetuado(block.timestamp);
        msg.sender.transfer(address(this).balance);
    }
    
    // fun��o callback
    function() public payable {
        require(msg.value > 0 && statusDoacao == StatusDoacao.ABERTO);
        emit LogDoacaoRecebida(msg.sender, msg.value);
        Doador memory d = Doador(msg.sender, msg.value, block.timestamp);
        doadores.push(d);
    }
}