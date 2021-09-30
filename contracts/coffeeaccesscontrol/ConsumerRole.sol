// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ConsumerRole' to manage this role - add, remove, check
contract ConsumerRole {
    using Roles for Roles.Role;

    event ConsumerAdded(address retailerAccount);
    event ConsumerRemoved(address retailerAccount);

    Roles.Role internal _consumers;

    constructor() {
        _addConsumer(msg.sender);
    }

    // Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyConsumer() {
        require(isConsumer(msg.sender));
        _;
    }

    // Define a function 'isConsumer' to check this role
    function isConsumer(address _account) public view returns (bool) {
        return _consumers.has(_account);
    }

    // Define a function 'addConsumer' that adds this role
    function addConsumer(address _account) public onlyConsumer {
        _addConsumer(_account);
    }

    // Define a function 'renounceConsumer' to renounce this role
    function renounceConsumer() public {
        _removeConsumer(msg.sender);
    }

    function _removeConsumer(address account_) internal {
        _consumers.remove(account_);
        emit ConsumerRemoved(account_);
    }

    function _addConsumer(address account_) internal {
        _consumers.add(account_);
        emit ConsumerAdded(account_);
    }
}
