//token_name	
//token_url	https://etherscan.io//address/0xaa64589ccddf0c4647fb34962936d1f5e83c1e4f#code
//spider_time	2018/07/08 12:27:00
//token_Transactions	1 txn
//token_price	

pragma solidity 0.4.13;

contract ERC20Interface {

    function totalSupply() public constant returns (uint);

    function balanceOf(address tokenOwner) public constant returns (uint balance);

    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);

    function transfer(address to, uint tokens) public returns (bool success);

    function approve(address spender, uint tokens) public returns (bool success);

    function transferFrom(address from, address to, uint tokens) public returns (bool success);


    event Transfer(address indexed from, address indexed to, uint tokens);

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}

contract ERC20Lookup {
    address public owner;

    function ERC20Lookup() public {
        owner = msg.sender;
    }

    function lookup(address[] addressesToCheck, address owner, address spender, bool includeAccountBalance, bool includeAllowance) 
        public
        constant
        returns(uint[], uint[], uint accountBalance)
    {

        uint[] memory balances = new uint[](addressesToCheck.length);
        uint[] memory allowances;

        // maybe less gas
        if (includeAllowance) {
            allowances = new uint[](addressesToCheck.length);
        }
        
        for (uint i = 0; i < addressesToCheck.length; i++) {
            ERC20Interface erc20 = ERC20Interface(addressesToCheck[i]);

            balances[i] = erc20.balanceOf(owner);
            
            // cache this in app; save gas, do more in one call
            if (includeAllowance) {
                allowances[i] = erc20.allowance(owner, spender);
            }
        }

        if (includeAccountBalance) {
            accountBalance = owner.balance;
        }

        return (balances, allowances, accountBalance);
    }

    function suicide() {
        require(msg.sender == owner);

        selfdestruct(msg.sender);
    }
}