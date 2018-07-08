//token_name	Test_(TEST)
//token_url	https://etherscan.io//address/0x6A8ED361a042A95538F3Ca8Ede2885a51E806C81#code
//spider_time	2018/07/08 12:06:23
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.18;

contract MyToken {

    string public name = "Test";
    string public symbol = "TEST";
    uint8 public decimals = 8;
    uint256 public initialSupply = 200000000;
    uint256 public totalSupply;
    
    mapping (address => uint256) public balanceOf;

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MyToken() public {
        totalSupply = initialSupply * 10 ** uint256(decimals); 
        balanceOf[msg.sender] = totalSupply;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
    }
}