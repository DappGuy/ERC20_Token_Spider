//token_name	
//token_url	https://etherscan.io//address/0xa4ebb48e4378e6f771b7f857623298bdb50c11b1#code
//spider_time	2018/07/08 12:22:09
//token_Transactions	2 txns
//token_price	

/*
 * DO NOT EDIT! DO NOT EDIT! DO NOT EDIT!
 *
 * This is an automatically generated file. It will be overwritten.
 *
 * For the original source see
 *    '/Users/ragolta/ETH/swaldman/helloworld/src/main/solidity/helloworld.sol'
 */

pragma solidity ^0.4.18;





contract HelloWorld{
    string input = "Hello world.";

    function sayHello() view public returns (string) {
        return input;
    }

    function setNewGreeting(string greeting) public {
        input = greeting;
    }
}