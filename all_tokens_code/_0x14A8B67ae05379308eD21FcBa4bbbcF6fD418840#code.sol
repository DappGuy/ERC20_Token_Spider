//token_name	
//token_url	https://etherscan.io//address/0x14A8B67ae05379308eD21FcBa4bbbcF6fD418840#code
//spider_time	2018/07/08 11:45:49
//token_Transactions	6 txns
//token_price	

pragma solidity ^0.4.23;

contract LoversForLife {
    struct Lovers {
        string lover1;
        string lover2;
        string whyDoYouLove;
        uint worth;
        
        
    }
    
    uint minPrice = 500000000000000;
    uint maxPrice = 500000000000000000;
    address creator;
    Lovers[] public loverList;
    uint public amountOfLovers = 0;
    mapping(address => uint) loverNumber;

    constructor() public {
        creator = msg.sender;
    }

    function setPrice(uint price) public{
        require(msg.sender == creator);
        minPrice = price;
    }
    
    function createLover(string l1, string l2, string message) public payable{
        require(msg.value >= minPrice);
        require(msg.value <= maxPrice);
        Lovers memory newLover = Lovers ({
            lover1: l1,
            lover2: l2,
            whyDoYouLove: message,
            worth: msg.value
            
            
        });
        
        loverList.push(newLover);
        loverNumber[msg.sender] = amountOfLovers;
        amountOfLovers++;
       
        creator.transfer(msg.value);
    }
    
    function findLover(address user) public view returns (uint){
        return loverNumber[user];
    }
    
    
    
    
}