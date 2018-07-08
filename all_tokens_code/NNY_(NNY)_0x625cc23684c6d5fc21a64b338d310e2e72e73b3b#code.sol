//token_name	NNY_(NNY)
//token_url	https://etherscan.io//address/0x625cc23684c6d5fc21a64b338d310e2e72e73b3b#code
//spider_time	2018/07/08 12:23:21
//token_Transactions	57 txns
//token_price	

pragma solidity ^0.4.19;

contract BaseToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != 0x0);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
        Transfer(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}

contract CustomToken is BaseToken {
    function CustomToken() public {
        totalSupply = 100000000000000000;
        name = 'NNY';
        symbol = 'NNY';
        decimals = 8;
        balanceOf[0x72a6cf112bc33a3df6ed8d9373ef624c9bc03836] = totalSupply;
        Transfer(address(0), 0x72a6cf112bc33a3df6ed8d9373ef624c9bc03836, totalSupply);
    }
}