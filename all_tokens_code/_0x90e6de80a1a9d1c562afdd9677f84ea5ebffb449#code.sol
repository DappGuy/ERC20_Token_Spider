//token_name	
//token_url	https://etherscan.io//address/0x90e6de80a1a9d1c562afdd9677f84ea5ebffb449#code
//spider_time	2018/07/08 11:48:38
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.23;

contract HTLC {
  address funder;
  address beneficiary;
  bytes32 public secret;
  bytes32 public hashSecret;
  uint public unlockTime;

  constructor(address beneficiary_, bytes32 hashSecret_, uint lockTime) public {
    beneficiary = beneficiary_;
    hashSecret = hashSecret_;
    unlockTime = now + lockTime * 1 minutes;
  }

  function() public payable {
    if (funder == 0) {
      funder = msg.sender;
    }
    if (msg.sender != funder) {
      revert();
    }
  }

  function resolve(bytes32 secret_) public {
    if (sha256(secret_) != hashSecret) {
      revert();
    }
    secret = secret_;
    beneficiary.transfer(address(this).balance);
  }

  function refund() public {
    if (now < unlockTime) {
      revert();
    }
    funder.transfer(address(this).balance);
  }
}