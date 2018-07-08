//token_name	
//token_url	https://etherscan.io//address/0xe6dbc3ac7cb89c4c46993f5115208d8c7f33f3c2#code
//spider_time	2018/07/08 12:11:40
//token_Transactions	13 txns
//token_price	

pragma solidity ^0.4.19;

// Add your message to the word cloud: https://jamespic.github.io/ether-wordcloud

contract WordCloud {
  address guyWhoGetsPaid = msg.sender;
  mapping (string => uint) wordSizes;
  event WordSizeIncreased(string word, uint newSize);

  function increaseWordSize(string word) external payable {
    wordSizes[word] += msg.value;
    guyWhoGetsPaid.transfer(this.balance);
    WordSizeIncreased(word, wordSizes[word]);
  }

  function wordSize(string word) external view returns (uint) {
    return wordSizes[word];
  }
}