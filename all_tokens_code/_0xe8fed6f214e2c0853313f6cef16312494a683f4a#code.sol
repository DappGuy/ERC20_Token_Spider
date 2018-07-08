//token_name	
//token_url	https://etherscan.io//address/0xe8fed6f214e2c0853313f6cef16312494a683f4a#code
//spider_time	2018/07/08 12:42:43
//token_Transactions	14 txns
//token_price	

pragma solidity ^0.4.10;

contract HeadEmUp {
    address private owner;
    event Player(bytes32);
    event House(bytes32);
    
    function HeadEmUp() {
        owner = msg.sender;
    }
    
    function rand(address _who) returns(bytes2){
        return bytes2(keccak256(_who,now));
    }
    
    function () payable {
        if (msg.sender == owner && msg.value > 0)
            return;
        if (msg.sender == owner && msg.value == 0)
            owner.transfer(this.balance);
        else {
            uint256 house_cut = msg.value / 100;
            owner.transfer(house_cut);
            bytes2 player = rand(msg.sender);
            bytes2 house = rand(owner);
            Player(bytes32(player));
            House(bytes32(house));
            if (player <= house){
                if (((msg.value) * 2 - house_cut) > this.balance)
                    msg.sender.transfer(this.balance);
                else
                    msg.sender.transfer(((msg.value) * 2 - house_cut));
            }   
        }
    }
}