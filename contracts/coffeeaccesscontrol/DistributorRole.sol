// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'DistributorRole' to manage this role - add, remove, check
contract DistributorRole {
    using Roles for Roles.Role;

    Roles.Role internal _distributers;

    event DistributorAdded(address distributorAccount);
    event DistributorRemoved(address distributorAccount);

    constructor() {
        _addDistributor(msg.sender);
    }

    // Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyDistributor() {
        require(isDistributor(msg.sender));
        _;
    }

    // Define a function 'isDistributor' to check this role
    function isDistributor(address account_) public view returns (bool) {
        return _distributers.has(account_);
    }

    // Define a function 'addDistributor' that adds this role
    function addDistributor(address account_) public onlyDistributor {
        _addDistributor(account_);
    }

    // Define a function 'renounceDistributor' to renounce this role
    function renounceDistributor() public {
        _removeDistributer(msg.sender);
    }

    function _addDistributor(address account_) internal {
        _distributers.add(account_);
        emit DistributorAdded(account_);
    }

    function _removeDistributer(address account_) internal {
        _distributers.remove(account_);
        emit DistributorRemoved(account_);
    }
}
