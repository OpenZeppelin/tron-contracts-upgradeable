// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITRC20} from "@openzeppelin/tron-contracts/token/TRC20/ITRC20.sol";
import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {TRC4626Upgradeable} from "../../token/TRC20/extensions/TRC4626Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

contract TRC4626MockUpgradeable is Initializable, TRC4626Upgradeable {
    function __TRC4626Mock_init(address underlying) internal onlyInitializing {
        __TRC20_init_unchained("TRC4626Mock", "E4626M");
        __TRC4626_init_unchained(ITRC20(underlying));
    }

    function __TRC4626Mock_init_unchained(address) internal onlyInitializing {}

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) external {
        _burn(account, amount);
    }
}
