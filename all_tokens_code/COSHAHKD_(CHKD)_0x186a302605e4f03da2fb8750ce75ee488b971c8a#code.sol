//token_name	COSHAHKD_(CHKD)
//token_url	https://etherscan.io//address/0x186a302605e4f03da2fb8750ce75ee488b971c8a#code
//spider_time	2018/07/08 12:36:02
//token_Transactions	4 txns
//token_price	

contract COSHAHKD {
    string public standard = 'CHKD 2.0';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public initialSupply;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

  
    function COSHAHKD() {

         initialSupply = 100000000000000;
         name ="COSHAHKD";
         decimals = 4;
         symbol = "CHKD";
        
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