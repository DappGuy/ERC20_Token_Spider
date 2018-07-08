//token_name	
//token_url	https://etherscan.io//address/0x2a7ff7db15f50d20fd9f102a0bf0c6917986c761#code
//spider_time	2018/07/08 11:51:31
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.23;

contract Store4Less {
  struct Pair {
    uint96 address1;
    uint32 data1;
    uint96 address2;
    uint32 data2;
  }
  
  // stored[iteration][index] = Pair
  mapping (uint => mapping (uint => Pair)) stored;

  function store(uint32 data) external {
    recursive_store(data, 1);
  }

  function recursive_store(uint32 data, uint iteration) internal {
    uint96 sender = uint96(uint(msg.sender) / 2**64);
    uint index = uint(msg.sender) % (4 ** iteration);
    if (stored[iteration][index].address1 == 0) {
      stored[iteration][index].address1 = sender;
      stored[iteration][index].data1 = data;
    } else if (stored[iteration][index].address1 == sender) {
      stored[iteration][index].data1 = data;
    } else if (stored[iteration][index].address2 == 0) {
      stored[iteration][index].address2 = sender;
      stored[iteration][index].data2 = data;
    } else if (stored[iteration][index].address2 == sender) {
      stored[iteration][index].data2 = data;
    } else {
      recursive_store(data, iteration + 1);
    }
  }

  function read() external returns (uint32) {
    return recursive_read(1);
  }

  function recursive_read(uint iteration) internal returns (uint32) {
    uint96 sender = uint96(uint(msg.sender) / 2**64);
    uint index = uint(msg.sender) % (4 ** iteration);
    if (stored[iteration][index].address1 == 0) {
      return 0;
    } else if (stored[iteration][index].address1 == sender) {
      return stored[iteration][index].data1;
    } else if (stored[iteration][index].address2 == 0) {
      return 0;
    } else if (stored[iteration][index].address2 == sender) {
      return stored[iteration][index].data2;
    } else {
      return recursive_read(iteration + 1);
    }
  }
}