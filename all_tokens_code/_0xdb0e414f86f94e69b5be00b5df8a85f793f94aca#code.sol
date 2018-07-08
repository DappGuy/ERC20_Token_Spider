//token_name	
//token_url	https://etherscan.io//address/0xdb0e414f86f94e69b5be00b5df8a85f793f94aca#code
//spider_time	2018/07/08 11:05:47
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.13;

interface RiskMgmtInterface {

    // METHODS
    // PUBLIC VIEW METHODS

    /// @notice Checks if the makeOrder price is reasonable and not manipulative
    /// @param orderPrice Price of Order
    /// @param referencePrice Reference price obtained through PriceFeed contract
    /// @param sellAsset Asset (as registered in Asset registrar) to be sold
    /// @param buyAsset Asset (as registered in Asset registrar) to be bought
    /// @param sellQuantity Quantity of sellAsset to be sold
    /// @param buyQuantity Quantity of buyAsset to be bought
    /// @return If makeOrder is permitted
    function isMakePermitted(
        uint orderPrice,
        uint referencePrice,
        address sellAsset,
        address buyAsset,
        uint sellQuantity,
        uint buyQuantity
    ) view returns (bool);

    /// @notice Checks if the takeOrder price is reasonable and not manipulative
    /// @param orderPrice Price of Order
    /// @param referencePrice Reference price obtained through PriceFeed contract
    /// @param sellAsset Asset (as registered in Asset registrar) to be sold
    /// @param buyAsset Asset (as registered in Asset registrar) to be bought
    /// @param sellQuantity Quantity of sellAsset to be sold
    /// @param buyQuantity Quantity of buyAsset to be bought
    /// @return If takeOrder is permitted
    function isTakePermitted(
        uint orderPrice,
        uint referencePrice,
        address sellAsset,
        address buyAsset,
        uint sellQuantity,
        uint buyQuantity
    ) view returns (bool);
}

contract NoRiskMgmt is RiskMgmtInterface {

    // PUBLIC VIEW METHODS

    /// @notice Checks if the makeOrder price is reasonable and not manipulative
    /// @param orderPrice Price of Order
    /// @param referencePrice Reference price obtained through PriceFeed contract
    /// @param sellAsset Asset (as registered in Asset registrar) to be sold
    /// @param buyAsset Asset (as registered in Asset registrar) to be bought
    /// @param sellQuantity Quantity of sellAsset to be sold
    /// @param buyQuantity Quantity of buyAsset to be bought
    /// @return If makeOrder is permitted
    function isMakePermitted(
        uint orderPrice,
        uint referencePrice,
        address sellAsset,
        address buyAsset,
        uint sellQuantity,
        uint buyQuantity
    )
        view
        returns (bool)
    {
        return true; // For testing purposes
    }

    /// @notice Checks if the makeOrder price is reasonable and not manipulative
    /// @param orderPrice Price of Order
    /// @param referencePrice Reference price obtained through PriceFeed contract
    /// @param sellAsset Asset (as registered in Asset registrar) to be sold
    /// @param buyAsset Asset (as registered in Asset registrar) to be bought
    /// @param sellQuantity Quantity of sellAsset to be sold
    /// @param buyQuantity Quantity of buyAsset to be bought
    /// @return If takeOrder is permitted
    function isTakePermitted(
        uint orderPrice,
        uint referencePrice,
        address sellAsset,
        address buyAsset,
        uint sellQuantity,
        uint buyQuantity
    )
        view
        returns (bool)
    {
        return true; // For testing purposes
    }
}