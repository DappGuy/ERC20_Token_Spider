//token_name	
//token_url	https://etherscan.io//address/0xacc45e45f1857f929ec6f9b924f977ba40fde9b6#code
//spider_time	2018/07/08 12:52:52
//token_Transactions	1 txn
//token_price	

// compiler: 0.4.19+commit.c4cbbb05.Emscripten.clang
pragma solidity ^0.4.19;

contract owned {
  address public owner;
  function owned() public { owner = msg.sender; }
  function changeOwner( address newowner ) public onlyOwner {owner = newowner;}
  function closedown() public onlyOwner { selfdestruct(owner); }
  modifier onlyOwner {
    if (msg.sender != owner) { revert(); }
    _;
  }
}

contract Whitelist is owned {

  address[] members_;

  function Whitelist() public {}
  function() public payable { revert(); }

  function count() public constant returns (uint) {
    return members_.length;
  }

  function memberAt( uint ix ) public constant returns (address) {
    return members_[ix];
  }

  function setMembers( address[] mbrs ) onlyOwner public {
    members_ = mbrs;
  }

  function add( address member ) onlyOwner public {
    int ix = toIndex( member );
    if (-1 == ix) members_.push( member );
  }

  function remove( address member ) onlyOwner public
  {
    int ix = toIndex( member );
    require( int(-1) != ix );

    // deletion leaves a gap - shuffle higher elements down one
    for ( uint jx = uint(ix); jx < members_.length - 1; jx++)
      members_[jx] = members_[jx+1];

    delete members_[members_.length - 1];
    members_.length--;
  }

  function toIndex( address who ) internal constant returns (int)
  {
    for( uint ix = 0; ix < members_.length; ix++ )
      if (members_[ix] == who) return int(ix);

    return int(-1);
  }
}