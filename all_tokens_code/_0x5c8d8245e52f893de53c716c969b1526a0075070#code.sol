//token_name	
//token_url	https://etherscan.io//address/0x5c8d8245e52f893de53c716c969b1526a0075070#code
//spider_time	2018/07/08 11:11:34
//token_Transactions	69 txns
//token_price	

pragma solidity ^0.4.18;

contract ERC20Interface {
  function transferFrom(address _from, address _to, uint _value) public returns (bool){}
}
contract Ownable {
  address public owner;

  function Ownable() public {
    owner = msg.sender;
  }

  modifier onlyOwner()  {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {

    if (newOwner != address(0)) {
      owner = newOwner;
    }
  }
}


contract ENXAirDrop is Ownable {

  function airDrop ( address contractObj,
                    address   tokenRepo,
                    address[] airDropDesinationAddress,
                    uint[] amounts) public onlyOwner{

    for( uint i = 0 ; i < airDropDesinationAddress.length ; i++ ) {

        ERC20Interface(contractObj).transferFrom( tokenRepo, airDropDesinationAddress[i],amounts[i]);
    }
   }
}