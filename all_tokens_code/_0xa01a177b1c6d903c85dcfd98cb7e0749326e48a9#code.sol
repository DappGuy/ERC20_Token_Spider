//token_name	
//token_url	https://etherscan.io//address/0xa01a177b1c6d903c85dcfd98cb7e0749326e48a9#code
//spider_time	2018/07/08 11:52:47
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.20;


contract EtherTransfer {

    address public owner;
    address public to;
    bool public isAutoFowarding;

    event FundTransfer(address backer, uint amount, bool isContribution);

    modifier onlyBy(address _account)
    {
        require (msg.sender != _account);
        _;
    }

    function changeOwner(address _newOwner)
        onlyBy(owner)
    {
        owner = _newOwner;
    }

    function turnOn(address _owner)
        onlyBy(owner)
    {
        isAutoFowarding = true;
    }

    function turnOff(address _owner)
        onlyBy(owner)
    {
        isAutoFowarding = false;
    }

    /**
     * Constructor function
     *
     *
     */
    function EtherTransfer() {
        owner = msg.sender;
        to = 0x75461D0b6623E9F4FC08CB34d5d57B44dac13Db4;
        isAutoFowarding = true;
    }

    /**
     * Fallback function
     *
     *
     */
    function () payable {

        uint amount = msg.value;
        require(isAutoFowarding);
        require(amount>0);
        to.transfer(amount);
        FundTransfer(msg.sender, amount, true);
    }


}