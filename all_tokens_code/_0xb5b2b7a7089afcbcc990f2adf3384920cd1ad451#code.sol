//token_name	
//token_url	https://etherscan.io//address/0xb5b2b7a7089afcbcc990f2adf3384920cd1ad451#code
//spider_time	2018/07/08 11:23:59
//token_Transactions	9 txns
//token_price	

pragma solidity ^0.4.23;

contract Ownable {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function withdraw() public onlyOwner{
        owner.transfer(address(this).balance);
    }

}


contract MagicBox is Ownable {
    uint256 public cancelFee = 10 finney;

    function setCancelFee(uint256 _fee) public onlyOwner{
        cancelFee = _fee;
    }
    
    function transfer(address _to,uint256 _amount) public payable{
        require(_to != address(0));
        require(msg.value>=_amount);
        _to.transfer(_amount);
    }
    
    function cancelTx() public payable{
        require(msg.value>=cancelFee);
    }
    
    function plain() public payable{
    }
    
    function() public payable{
    }

}