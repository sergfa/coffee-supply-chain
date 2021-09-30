// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'RetailerRole' to manage this role - add, remove, check
contract RetailerRole {
    using Roles for Roles.Role;

    Roles.Role internal _retailers;

    event RetailerAdded(address account_);
    event RetailerRemoved(address account_);

    constructor() {
        _addRetailer(msg.sender);
    }

    // Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyRetailer() {
        require(isRetailer(msg.sender));
        _;
    }

    // Define a function 'addRetailer' that adds this role
    function addRetailer(address account_) public onlyRetailer {
        _addRetailer(account_);
    }

    // Define a function 'renounceRetailer' to renounce this role
    function renounceRetailer() public {
        _removeRetailer(msg.sender);
    }

    // Define a function 'isRetailer' to check this role
    function isRetailer(address account_) public view returns (bool) {
        return _retailers.has(account_);
    }

    function _addRetailer(address account_) internal {
        _retailers.add(account_);
        emit RetailerAdded(account_);
    }

    function _removeRetailer(address account_) internal {
        _retailers.remove(account_);
        emit RetailerRemoved(account_);
    }
}
