// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Address} from "@openzeppelin/tron-contracts/utils/Address.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

contract TRC20ReentrantUpgradeable is Initializable, TRC20Upgradeable {
    enum Type {
        No,
        Before,
        After
    }

    Type private _reenterType;
    address private _reenterTarget;
    bytes private _reenterData;

    function __TRC20Reentrant_init() internal onlyInitializing {
        __TRC20_init_unchained("TEST", "TST");
    }

    function __TRC20Reentrant_init_unchained() internal onlyInitializing {}
    function scheduleReenter(Type when, address target, bytes calldata data) external {
        _reenterType = when;
        _reenterTarget = target;
        _reenterData = data;
    }

    function functionCall(address target, bytes memory data) public returns (bytes memory) {
        return Address.functionCall(target, data);
    }

    function _update(address from, address to, uint256 amount) internal override {
        if (_reenterType == Type.Before) {
            _reenterType = Type.No;
            functionCall(_reenterTarget, _reenterData);
        }
        super._update(from, to, amount);
        if (_reenterType == Type.After) {
            _reenterType = Type.No;
            functionCall(_reenterTarget, _reenterData);
        }
    }
}
