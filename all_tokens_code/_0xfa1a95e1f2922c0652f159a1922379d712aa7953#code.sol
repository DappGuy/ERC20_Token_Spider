//token_name	
//token_url	https://etherscan.io//address/0xfa1a95e1f2922c0652f159a1922379d712aa7953#code
//spider_time	2018/07/08 12:06:15
//token_Transactions	2 txns
//token_price	

// 0.4.21+commit.dfe3193c.Emscripten.clang
pragma solidity ^0.4.21;

// assume ERC20 or compatible token
interface ERC20 {
  function transfer( address to, uint256 value ) external;
}

contract Airdropper {

  // NOTE: be careful about array size and block gas limit. check ethstats.net
  function airdrop( address tokAddr,
                    address[] dests,
                    uint[] quantities ) public returns (uint) {

    for (uint ii = 0; ii < dests.length; ii++) {
      ERC20(tokAddr).transfer( dests[ii], quantities[ii] );
    }

    return ii;
  }
}