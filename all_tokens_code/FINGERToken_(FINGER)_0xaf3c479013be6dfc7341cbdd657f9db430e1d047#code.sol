//token_name	FINGERToken_(FINGER)
//token_url	https://etherscan.io//address/0xaf3c479013be6dfc7341cbdd657f9db430e1d047#code
//spider_time	2018/07/08 12:35:42
//token_Transactions	1 txn
//token_price	

contract FINGERToken {
    string public standard = 'FINGER 2.0';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public initialSupply;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

  
    function FINGERToken() {

         initialSupply = 2100000000000000;
         name ="FINGERToken";
         decimals = 8;
         symbol = "FINGER";
        
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