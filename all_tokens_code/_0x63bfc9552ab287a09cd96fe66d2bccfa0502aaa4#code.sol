//token_name	
//token_url	https://etherscan.io//address/0x63bfc9552ab287a09cd96fe66d2bccfa0502aaa4#code
//spider_time	2018/07/08 12:04:37
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.8;                  //specify compiler version
//this is a comment!

contract Josephtoken {                     //this is a smart contract!
    
    address owner;                       //which account gets the 1000 josephtoken to begin with
    mapping (address => uint) balances;  //keep track of the number of josephtoken in each account
    
    function Josephtoken() public {
        owner = msg.sender;              //msg.sender is the address of the account that called the function
                                         //here, msg.sender is the account that deployed the contract
        balances[owner] = 1000;          //mint the owner 1000 josephtoken and put it in the mapping
    }
    
    function transfer(uint amount, address recipient) public {      //move josephtoken between accounts
        require(balances[msg.sender] >= amount);
        require(balances[msg.sender] - amount <= balances[msg.sender]);
        require(balances[recipient] + amount >= balances[recipient]);
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        //hmm, how might evil attacker Jennifer try to exploit this function?
    }
}