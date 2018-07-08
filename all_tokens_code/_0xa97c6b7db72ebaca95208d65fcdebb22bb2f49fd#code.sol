//token_name	
//token_url	https://etherscan.io//address/0xa97c6b7db72ebaca95208d65fcdebb22bb2f49fd#code
//spider_time	2018/07/08 11:25:31
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.15;

contract Owner {

//=================Variables================
    bool isInitiated = false;

    //Addresses
    address creatorAddress;
    address ownerAddress;
    uint idCustomer;

    //State

    //Modifiers
    modifier onlyBy(address _account) {
        require(msg.sender == _account);
        _;
    }

//=================Transactions================
    //Constructor
    function Owner(address _ownerAddress, uint _idCustomer) {
        creatorAddress = msg.sender;
        ownerAddress = _ownerAddress;
        idCustomer = _idCustomer;
        isInitiated = true;
    }


    function updateOwner(address _newOwnerAddress)
      onlyBy(creatorAddress) {
        ownerAddress = _newOwnerAddress;
    }


//=================Calls================
    //Return basic information about the contract
    function getInfos() constant returns(address, address, uint) {
        return (creatorAddress,
                ownerAddress,
                idCustomer
                );
    }

    function getInitiated() constant returns(bool) {
        return isInitiated;
    }
}