// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

abstract contract TRC20DecimalsMockUpgradeable is Initializable, TRC20Upgradeable {
    uint8 private _decimals;

    function __TRC20DecimalsMock_init(uint8 decimals_) internal onlyInitializing {
        __TRC20DecimalsMock_init_unchained(decimals_);
    }

    function __TRC20DecimalsMock_init_unchained(uint8 decimals_) internal onlyInitializing {
        _decimals = decimals_;
    }

    function decimals() public view override returns (uint8) {
        return _decimals;
    }
}
