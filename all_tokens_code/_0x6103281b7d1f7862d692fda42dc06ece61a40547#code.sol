//token_name	
//token_url	https://etherscan.io//address/0x6103281b7d1f7862d692fda42dc06ece61a40547#code
//spider_time	2018/07/08 11:19:04
//token_Transactions	161 txns
//token_price	

pragma solidity ^0.4.24;

contract OneSingleCoin {
    uint256 public currentHodlerId;
    address public currentHodler;
    address[] public previousHodlers;
    
    string[] public messages;
    uint256 public price;
    
    event Purchased(
        uint indexed _buyerId,
        address _buyer
    );

    mapping (address => uint) public balance;

    constructor() public {
        currentHodler = msg.sender;
        currentHodlerId = 0;
        messages.push("One coin to rule them all");
        price = 8 finney;
        emit Purchased(currentHodlerId, currentHodler);
    }

    function buy(string message) public payable returns (bool) {
        require (msg.value >= price);
        
        if (msg.value > price) {
            balance[msg.sender] += msg.value - price;
        }
        uint256 previousHodlersCount = previousHodlers.length;
        for (uint256 i = 0; i < previousHodlersCount; i++) {
            balance[previousHodlers[i]] += (price * 8 / 100) / previousHodlersCount;
        }
        balance[currentHodler] += price * 92 / 100;

        price = price * 120 / 100;  
        previousHodlers.push(currentHodler);
        messages.push(message);
        
        currentHodler = msg.sender;
        currentHodlerId = previousHodlersCount + 1;
        emit Purchased(currentHodlerId, currentHodler);
    }

    function withdraw() public {
        uint amount = balance[msg.sender];
        balance[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}