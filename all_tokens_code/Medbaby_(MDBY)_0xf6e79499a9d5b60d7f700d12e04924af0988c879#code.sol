//token_name	Medbaby_(MDBY)
//token_url	https://etherscan.io//address/0xf6e79499a9d5b60d7f700d12e04924af0988c879#code
//spider_time	2018/07/08 12:49:53
//token_Transactions	1 txn
//token_price	

contract Medbaby {
  
    /* Public variables of the token */
    string public standard;
    string public name = "Medbaby";
    string public symbol = "MDBY";
    uint8 public decimals = 3;
    uint256 public initialSupply = 300000000000;
    uint256 public totalSupply = 200000000000;
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

  
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function Medbaby() {

         initialSupply = 300000000000;
         name ="Medbaby";
        decimals = 2;
         symbol = "MDBY";
        
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        totalSupply = initialSupply;                        // Update total supply
                                   
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
      
    }

   

    

   

    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}