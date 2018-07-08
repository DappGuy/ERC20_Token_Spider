//token_name	
//token_url	https://etherscan.io//address/0xF9219352B740eaa673ccF92B26d3a06Fae4ca6D4#code
//spider_time	2018/07/08 11:30:49
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.21;

contract Ownable {
    mapping (address => bool) public owners;

    modifier onlyOwner {        
        require(true == owners[msg.sender]);
        _;
    }

    function addOwner(address ownerAddress) public {
        owners[ownerAddress] = true;
    }

    function delOwner(address ownerAddress) public {
        owners[ownerAddress] = false;
    }
}

contract Market_Price is Ownable{
    uint256 usdEth;
    uint256 usdBtc;

    function getUSDEth() public view returns(uint256){
        return usdEth;
    }

    function setUSDEth(uint256 _usdEth) onlyOwner public {
        usdEth = _usdEth;
    }

    function getUSDBtc() public view returns(uint256){
        return usdBtc;
    }

    function setUSDBtc(uint256 _usdBtc) onlyOwner public {
        usdBtc = _usdBtc;
    }
}