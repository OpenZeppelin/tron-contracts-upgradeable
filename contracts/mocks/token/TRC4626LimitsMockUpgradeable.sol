// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC4626Upgradeable} from "../../token/TRC20/extensions/TRC4626Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

abstract contract TRC4626LimitsMockUpgradeable is Initializable, TRC4626Upgradeable {
    uint256 _maxDeposit;
    uint256 _maxMint;

    function __TRC4626LimitsMock_init() internal onlyInitializing {
        __TRC4626LimitsMock_init_unchained();
    }

    function __TRC4626LimitsMock_init_unchained() internal onlyInitializing {
        _maxDeposit = 100 * 10 ** 18;
        _maxMint = 100 * 10 ** 18;
    }

    function maxDeposit(address) public view override returns (uint256) {
        return _maxDeposit;
    }

    function maxMint(address) public view override returns (uint256) {
        return _maxMint;
    }
}
