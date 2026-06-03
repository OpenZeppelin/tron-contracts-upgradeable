// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
import {Initializable} from "../../proxy/utils/Initializable.sol";

contract TRC20ExcessDecimalsMockUpgradeable is Initializable {
    function __TRC20ExcessDecimalsMock_init() internal onlyInitializing {
    }

    function __TRC20ExcessDecimalsMock_init_unchained() internal onlyInitializing {
    }
    function decimals() public pure returns (uint256) {
        return type(uint256).max;
    }
}
