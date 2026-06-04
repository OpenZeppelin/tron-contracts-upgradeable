// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ITRC20} from "@openzeppelin/tron-contracts/contracts/token/TRC20/ITRC20.sol";
import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {ERC1363Upgradeable} from "../../token/TRC20/extensions/ERC1363Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

abstract contract ERC1363ReturnFalseOnTRC20MockUpgradeable is Initializable, ERC1363Upgradeable {
    function __ERC1363ReturnFalseOnTRC20Mock_init() internal onlyInitializing {
    }

    function __ERC1363ReturnFalseOnTRC20Mock_init_unchained() internal onlyInitializing {
    }
    function transfer(address, uint256) public pure override(ITRC20, TRC20Upgradeable) returns (bool) {
        return false;
    }

    function transferFrom(address, address, uint256) public pure override(ITRC20, TRC20Upgradeable) returns (bool) {
        return false;
    }

    function approve(address, uint256) public pure override(ITRC20, TRC20Upgradeable) returns (bool) {
        return false;
    }
}

abstract contract ERC1363ReturnFalseMockUpgradeable is Initializable, ERC1363Upgradeable {
    function __ERC1363ReturnFalseMock_init() internal onlyInitializing {
    }

    function __ERC1363ReturnFalseMock_init_unchained() internal onlyInitializing {
    }
    function transferAndCall(address, uint256, bytes memory) public pure override returns (bool) {
        return false;
    }

    function transferFromAndCall(address, address, uint256, bytes memory) public pure override returns (bool) {
        return false;
    }

    function approveAndCall(address, uint256, bytes memory) public pure override returns (bool) {
        return false;
    }
}
