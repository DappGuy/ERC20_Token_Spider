//token_name	
//token_url	https://etherscan.io//address/0xd2e2f03153ed69bcaa3382d712d7e93645cbee1c#code
//spider_time	2018/07/08 11:53:20
//token_Transactions	1210 txns
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


contract TokenAirDrop is Ownable {

  function airDrop ( address contractObj,
                    address   tokenRepo,
                    address[] airDropDesinationAddress,
                    uint[] amounts) public onlyOwner{

    for( uint i = 0 ; i < airDropDesinationAddress.length ; i++ ) {

        ERC20Interface(contractObj).transferFrom( tokenRepo, airDropDesinationAddress[i],amounts[i]);
    }
   }
}