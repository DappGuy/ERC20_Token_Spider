//token_name	
//token_url	https://etherscan.io//address/0x17e5e0910b9185b0ede564dcbf074ca910ad56a4#code
//spider_time	2018/07/08 12:32:05
//token_Transactions	4 txns
//token_price	

contract TeikhosBounty {

    // Proof-of-public-key in format 2xbytes32, to support xor operator and ecrecover r, s v format
    bytes32 proof_of_public_key1 = hex"381c185bf75548b134adc3affd0cc13e66b16feb125486322fa5f47cb80a5bf0";
    bytes32 proof_of_public_key2 = hex"5f9d1d2152eae0513a4814bd8e6b0dd3ac8f6310c0494c03e9aa08bcd867c352";

    function authenticate(bytes _publicKey) { // Accepts an array of bytes, for example ["0x00","0xaa", "0xff"]

        // Get address from public key
        address signer = address(keccak256(_publicKey));

        // Split public key in 2xbytes32, to support xor operator and ecrecover r, s v format

        bytes32 publicKey1;
        bytes32 publicKey2;

        assembly {
        publicKey1 := mload(add(_publicKey,0x20))
        publicKey2 := mload(add(_publicKey,0x40))
        }

        // Use xor (reverse cipher) to get signature in r, s v format
        bytes32 r = proof_of_public_key1 ^ publicKey1;
        bytes32 s = proof_of_public_key2 ^ publicKey2;

        bytes32 msgHash = keccak256("\x19Ethereum Signed Message:\n64", _publicKey);

        // The value v is not known, try both 27 and 28
        if(ecrecover(msgHash, 27, r, s) == signer) suicide(msg.sender);
        if(ecrecover(msgHash, 28, r, s) == signer) suicide(msg.sender);
    }
    
    function() payable {}                            

}