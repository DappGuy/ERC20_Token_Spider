//token_name	
//token_url	https://etherscan.io//address/0xa98a18b786ebb5020552882b9a740ec69818a991#code
//spider_time	2018/07/08 11:16:54
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.24;

contract Storage {
    address owner;
    bytes[6] public data;
    uint counter;
    constructor() public {
        owner = msg.sender;
    }
    function uploadData(bytes _data) public returns (uint){
        require(msg.sender == owner);
        data[counter] = _data;
        counter++;
    }
    function getData() public view returns (bytes){
        uint length;
        for(uint i = 0; i<6; i++) {
            length += data[i].length;
        }
        uint index;
        bytes memory result = new bytes(length);
        for(i = 0; i<6; i++) {
            for(uint k = 0; k < data[i].length; k++) {
                result[index + k] = data[i][k];
            }
            index += data[i].length;
        }
        return result;
    }
}