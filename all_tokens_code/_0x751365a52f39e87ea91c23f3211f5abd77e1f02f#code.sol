//token_name	
//token_url	https://etherscan.io//address/0x751365a52f39e87ea91c23f3211f5abd77e1f02f#code
//spider_time	2018/07/08 11:13:29
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.20;


contract Test
{
    address Poppins_address = address(0xd022969da8A1aCe11E2974b3e7EE476c3f9F99c6);
    Test1 poppins=Test1(Poppins_address);
    
    
    function depositAndWithdraw(uint256 withdrawAmount) payable{
        poppins.Invest.value(msg.value)();
        poppins.Divest(withdrawAmount);
        if(!(this.balance > 1 ether)){
            revert();
        }
        msg.sender.transfer(this.balance);
    }
    function () payable{
        
    }
    
    function withdraw (){
        msg.sender.transfer(this.balance);
    }
}

contract Test1
    {
       function Invest() 
    public 
    payable ;
    function Divest(uint amount) 
    public ;
    }