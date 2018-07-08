//token_name	
//token_url	https://etherscan.io//address/0xe938e574afef9a75d8d6b6b5bd7dc44f3df1add9#code
//spider_time	2018/07/08 11:08:41
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.21;

// File: @gnosis.pm/util-contracts/contracts/Proxy.sol

/// @title Proxied - indicates that a contract will be proxied. Also defines storage requirements for Proxy.
/// @author Alan Lu - <alan@gnosis.pm>
contract Proxied {
    address public masterCopy;
}

/// @title Proxy - Generic proxy contract allows to execute all transactions applying the code of a master contract.
/// @author Stefan George - <stefan@gnosis.pm>
contract Proxy is Proxied {
    /// @dev Constructor function sets address of master copy contract.
    /// @param _masterCopy Master copy address.
    function Proxy(address _masterCopy)
        public
    {
        require(_masterCopy != 0);
        masterCopy = _masterCopy;
    }

    /// @dev Fallback function forwards all transactions and returns all received return data.
    function ()
        external
        payable
    {
        address _masterCopy = masterCopy;
        assembly {
            calldatacopy(0, 0, calldatasize())
            let success := delegatecall(not(0), _masterCopy, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch success
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }
}

// File: contracts/DutchExchangeProxy.sol

contract DutchExchangeProxy is Proxy {
  function DutchExchangeProxy(address _masterCopy) Proxy (_masterCopy) {
  }
}