// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "../../../../proxy/utils/Initializable.sol";

contract GLDTokenUpgradeable is Initializable, TRC20Upgradeable {
    function __GLDToken_init(uint256 initialSupply) internal onlyInitializing {
        __TRC20_init_unchained("Gold", "GLD");
        __GLDToken_init_unchained(initialSupply);
    }

    function __GLDToken_init_unchained(uint256 initialSupply) internal onlyInitializing {
        _mint(msg.sender, initialSupply);
    }
}
