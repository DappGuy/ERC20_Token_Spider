//token_name	COSHASGD_(CSGD)
//token_url	https://etherscan.io//address/0xc3d30f008cc2e86b4fec86837815293739ed9a8d#code
//spider_time	2018/07/08 12:36:03
//token_Transactions	4 txns
//token_price	

contract COSHASGD {
    string public standard = 'CSGD 2.0';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public initialSupply;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

  
    function COSHASGD() {

         initialSupply = 50000000000000;
         name ="COSHASGD";
         decimals = 4;
         symbol = "CSGD";
        
        balanceOf[msg.sender] = initialSupply;
        totalSupply = initialSupply;
                                   
    }

    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
      
    }

    function () {
        throw;
    }
}