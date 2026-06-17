// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Mock that mimics TRON USDT (`TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t`): `transfer` performs the transfer
 * (reverting on failure, e.g. insufficient balance) but returns `false` even on success. `transferFrom` and
 * `approve` are left unchanged (return `true`), matching the real contract — only `transfer` is broken.
 */
abstract contract TRC20USDTMockUpgradeable is Initializable, TRC20Upgradeable {
    function __TRC20USDTMock_init() internal onlyInitializing {
    }

    function __TRC20USDTMock_init_unchained() internal onlyInitializing {
    }
    function transfer(address to, uint256 value) public override returns (bool) {
        super.transfer(to, value);
        return false;
    }
}
