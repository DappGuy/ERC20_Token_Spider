//token_name	
//token_url	https://etherscan.io//address/0x5cd38626b95abbe832eefb487df9de4ba75976c5#code
//spider_time	2018/07/08 11:46:31
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.23;

/**
 * @title Datatrust Anchoring system
 * @author Blockchain Partner
 * @author https://blockchainpartner.fr
 */
contract Datatrust {

    // Mapping from Merkle tree root hashes to their anchored state
    mapping (bytes32 => bool) public anchors;

    // Event emitted when saving a new anchor
    event NewAnchor(bytes32 merkleRoot);
    
    /**
     * @dev Save a new anchor for a given Merkle tree root hash
     * @param _merkleRoot bytes32 hash to anchor
     */
    function saveNewAnchor(bytes32 _merkleRoot) public {
        anchors[_merkleRoot] = true;
        emit NewAnchor(_merkleRoot);
    }
}