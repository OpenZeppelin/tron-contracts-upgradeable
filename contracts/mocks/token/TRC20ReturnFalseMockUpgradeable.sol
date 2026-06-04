// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

abstract contract TRC20ReturnFalseMockUpgradeable is Initializable, TRC20Upgradeable {
    function __TRC20ReturnFalseMock_init() internal onlyInitializing {
    }

    function __TRC20ReturnFalseMock_init_unchained() internal onlyInitializing {
    }
    function transfer(address, uint256) public pure override returns (bool) {
        return false;
    }

    function transferFrom(address, address, uint256) public pure override returns (bool) {
        return false;
    }

    function approve(address, uint256) public pure override returns (bool) {
        return false;
    }
}
