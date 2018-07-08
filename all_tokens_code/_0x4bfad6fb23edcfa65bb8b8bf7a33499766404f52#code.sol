//token_name	
//token_url	https://etherscan.io//address/0x4bfad6fb23edcfa65bb8b8bf7a33499766404f52#code
//spider_time	2018/07/08 12:15:35
//token_Transactions	3 txns
//token_price	

pragma solidity ^0.4.0;
contract theCyberGatekeeper {
  function enter(bytes32 _passcode, bytes8 _gateKey) public {}
}

contract GateProxy {
    function enter(bytes32 _passcode, bytes8 _gateKey, uint16 _gas) public {
        theCyberGatekeeper(0x44919b8026f38D70437A8eB3BE47B06aB1c3E4Bf).enter.gas(_gas)(_passcode, _gateKey);
    }
}