//token_name	
//token_url	https://etherscan.io//address/0x83bf4ce7a3937ef86f6eb8082e09ce39c52be697#code
//spider_time	2018/07/08 12:33:37
//token_Transactions	15 txns
//token_price	

pragma solidity ^0.4.16;

interface token {
    function transfer(address receiver, uint amount) public;
	function balanceOf(address check) public;
}



contract Marketplace {
    address public beneficiary;
    uint public amountRaised;
	uint public totalIncome;
    uint public price;
	 
    token public tokenReward;
	
    mapping(address => uint256) public balanceOf;
    bool changePrice = false;

    event DepositBeneficiary(address recipient, uint totalAmountRaised);
    event FundTransfer(address backer, uint amount );
    event ChangePrice(uint prices);
    /**
     * Constructor function
     *
     * Setup the owner
     */
    function Marketplace(
        address ifSuccessfulSendTo,
        uint etherCostOfEachToken,
        address addressOfTokenUsedAsReward
    )public {
        beneficiary = ifSuccessfulSendTo;
        price = etherCostOfEachToken * 1 finney;
        tokenReward = token(addressOfTokenUsedAsReward);
    }


    function () public payable {
        uint amount = msg.value;
        balanceOf[msg.sender] += amount;
        amountRaised += amount;
		totalIncome += amount; 
        tokenReward.transfer(msg.sender, amount / price);
		FundTransfer(beneficiary, amount);
    }



    

    //transfer token to the owner of the contract (beneficiary)
        function transferToken(uint amount)public  {  
			if (beneficiary == msg.sender)
			{            
				tokenReward.transfer(msg.sender, amount);  
			}
       
		}
		function safeWithdrawal() public {
			if (beneficiary == msg.sender) {
					if(beneficiary.send(amountRaised)){
					FundTransfer(beneficiary, amountRaised);
					amountRaised = 0;
					}
			}
		}
 

    function checkPriceCrowdsale(uint newPrice1, uint newPrice2)public {
        if (beneficiary == msg.sender) {          
           price = (newPrice1 * 1 finney)+(newPrice2 * 1 szabo);
           ChangePrice(price);
           changePrice = true;
        }

    }
}