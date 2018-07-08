//token_name	
//token_url	https://etherscan.io//address/0xb8a7bd568745db534f26deed413ae3fcd59ba708#code
//spider_time	2018/07/08 11:12:09
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.24;

contract Outer {
    Inner1 public myInner1 = new Inner1();
    
    function callSomeFunctionViaOuter() public {
        myInner1.callSomeFunctionViaInner1();
    }
}

contract Inner1 {
    Inner2 public myInner2 = new Inner2();
    
    function callSomeFunctionViaInner1() public {
        myInner2.doSomething();
    }
}

contract Inner2 {
    uint256 someValue;
    event SetValue(uint256 val);
    
    function doSomething() public {
        someValue = block.timestamp;
        emit SetValue(someValue);
    }
}