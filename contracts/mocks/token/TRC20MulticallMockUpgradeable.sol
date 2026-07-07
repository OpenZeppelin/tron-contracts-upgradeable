// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {MulticallUpgradeable} from "../../utils/MulticallUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

abstract contract TRC20MulticallMockUpgradeable is Initializable, TRC20Upgradeable, MulticallUpgradeable {
    function __TRC20MulticallMock_init() internal onlyInitializing {}

    function __TRC20MulticallMock_init_unchained() internal onlyInitializing {}
}
