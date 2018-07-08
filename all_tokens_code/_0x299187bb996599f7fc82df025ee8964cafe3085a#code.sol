//token_name	
//token_url	https://etherscan.io//address/0x299187bb996599f7fc82df025ee8964cafe3085a#code
//spider_time	2018/07/08 12:01:39
//token_Transactions	5 txns
//token_price	

pragma solidity ^0.4.11;

contract Challenge {
    address public owner;
    address public previous_owner;
    address public creator;

    bytes32 public flag_hash = 0xfa9b079005103147ac67299be9119fb4a47e29801f2d8d5025f36b248ce23695;

    function Challenge() public {
        owner = msg.sender;
        creator = msg.sender;
    }

    function withdraw() public {
        require(address(this).balance > 0);

        if(address(this).balance > 0.01 ether) {
            previous_owner.transfer(address(this).balance - 0.01 ether);
        }
        creator.transfer(address(this).balance);
    }

    function change_flag_hash(bytes32 data) public payable {
        require(msg.value > 0.003 ether);
        require(msg.sender == owner);

        flag_hash = data;
    }

    function check_flag(bytes32 data) public payable returns (bool) {
        require(msg.value > address(this).balance - msg.value);
        require(msg.sender != owner && msg.sender != previous_owner);
        require(keccak256(data) == flag_hash);

        previous_owner = owner;
        owner = msg.sender;

        return true;
    }
}