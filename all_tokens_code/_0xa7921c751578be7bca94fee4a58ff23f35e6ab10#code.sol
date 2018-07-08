//token_name	
//token_url	https://etherscan.io//address/0xa7921c751578be7bca94fee4a58ff23f35e6ab10#code
//spider_time	2018/07/08 11:24:53
//token_Transactions	56 txns
//token_price	

pragma solidity ^0.4.17;

contract Marriage {
    struct Signage {
        string name1;
        string vow1;
        string name2;
        string vow2;
    }

    address public sealer;
    string public sealedBy;
    uint256 public numMarriages;

    Signage[] signages;

    function Marriage(string sealerName, address sealerAddress) public {
        sealedBy = sealerName;
        sealer = sealerAddress;
    }

    function sign(string vow1, string name1, string vow2, string name2) public {
        require(msg.sender == sealer);

        Signage memory signage = Signage(
            vow1,
            name1,
            vow2,
            name2
        );
        signages.push(signage);
        numMarriages +=1 ;
    }

    function getMarriage(uint256 index)
        public
        constant returns (string, string, string, string)
    {
        return (signages[index].vow1, signages[index].name1, signages[index].vow2, signages[index].name2);
    }
}