//token_name	
//token_url	https://etherscan.io//address/0x0d3094d335e3986268d7d144de9106a01aaa313c#code
//spider_time	2018/07/08 11:43:23
//token_Transactions	3 txns
//token_price	

contract ERC20Basic {
  uint public totalSupply;
  function balanceOf(address who) constant returns (uint);
  function transfer(address to, uint value);
  event Transfer(address indexed from, address indexed to, uint value);
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) constant returns (uint);
  function transferFrom(address from, address to, uint value);
  function approve(address spender, uint value);
  event Approval(address indexed owner, address indexed spender, uint value);
}


contract MultiSender {

    function multisend(address _tokenAddr, address[] dests, uint256[] values)
    returns (uint256) {
        uint256 i = 0;
        while (i < dests.length) {
           ERC20(_tokenAddr).transfer(dests[i], values[i]);
           i += 1;
        }
        return(i);
    }
}