// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC4626Upgradeable} from "../../token/TRC20/extensions/TRC4626Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

abstract contract TRC4626OffsetMockUpgradeable is Initializable, TRC4626Upgradeable {
    uint8 private _offset;

    function __TRC4626OffsetMock_init(uint8 offset_) internal onlyInitializing {
        __TRC4626OffsetMock_init_unchained(offset_);
    }

    function __TRC4626OffsetMock_init_unchained(uint8 offset_) internal onlyInitializing {
        _offset = offset_;
    }

    function _decimalsOffset() internal view virtual override returns (uint8) {
        return _offset;
    }
}
