//token_name	
//token_url	https://etherscan.io//address/0xb05faba79ac993dc1ff7e3a0a764c3d0478cdc1f#code
//spider_time	2018/07/08 12:46:51
//token_Transactions	7 txns
//token_price	

pragma solidity ^0.4.17;

/*

 * source       https://github.com/blockbitsio/

 * @name        General Funding Input Contract
 * @package     BlockBitsIO
 * @author      Micky Socaci <micky@nowlive.ro>

*/



contract FundingInputGeneral {

    bool public initialized = false;
    uint8 public typeId = 0;
    address public FundingAssetAddress;
    address public deployer;

    event EventInputPaymentReceived(address sender, uint amount, uint8 _type);

    function FundingInputGeneral() public {
        deployer = msg.sender;
    }

    function setFundingAssetAddress(address _addr) public {
        require(initialized == false && msg.sender == deployer);
        FundingAssetAddress = _addr;
        initialized = true;
    }

    function () public payable {
        buy();
    }

    function buy() public payable returns(bool) {
        if(msg.value > 0) {
            if(isContract(FundingAssetAddress)) {
                if(FundingAssetAddress.call.value(msg.value)(bytes4(bytes32(keccak256("receivePayment(address,uint8)"))), msg.sender, typeId)) {
                    EventInputPaymentReceived(msg.sender, msg.value, typeId);
                    return true;
                } else {
                    revert();
                }
            }
            else {
                revert();
            }
        } else {
            revert();
        }
    }

    // this call adds 704 gas, good enough to keep
    function isContract(address addr) internal view returns (bool) {
        uint size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }
}

/*

 * source       https://github.com/blockbitsio/

 * @name        Direct Funding Input Contract
 * @package     BlockBitsIO
 * @author      Micky Socaci <micky@nowlive.ro>

*/





contract FundingInputDirect is FundingInputGeneral {
    function FundingInputDirect() FundingInputGeneral() public {
        typeId = 1;
    }
}