//token_name	
//token_url	https://etherscan.io//address/0x2b07973233241983ec13d15d990d8e8e7575cc0b#code
//spider_time	2018/07/08 11:12:04
//token_Transactions	2 txns
//token_price	

pragma solidity ^0.4.24;

contract OuterWithEth {
    Inner1WithEth public myInner1 = new Inner1WithEth();
    
    function callSomeFunctionViaOuter() public payable {
        myInner1.callSomeFunctionViaInner1.value(msg.value)();
    }
}

contract Inner1WithEth {
    Inner2WithEth public myInner2 = new Inner2WithEth();
    
    function callSomeFunctionViaInner1() public payable{
        myInner2.doSomething.value(msg.value)();
    }
}

contract Inner2WithEth {
    uint256 someValue;
    event SetValue(uint256 val);
    
    function doSomething() public payable {
        someValue = block.timestamp;
        emit SetValue(someValue);
    }
    
    function getAllMoneyOut() public {
        msg.sender.transfer(this.balance);
    }
}