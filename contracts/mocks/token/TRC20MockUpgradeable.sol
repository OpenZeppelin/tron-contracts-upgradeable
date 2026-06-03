// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

contract TRC20MockUpgradeable is Initializable, TRC20Upgradeable {
    function __TRC20Mock_init() internal onlyInitializing {
        __TRC20_init_unchained("TRC20Mock", "E20M");
    }

    function __TRC20Mock_init_unchained() internal onlyInitializing {}

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) external {
        _burn(account, amount);
    }
}
