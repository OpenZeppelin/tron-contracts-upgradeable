// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

abstract contract TRC20NoReturnMockUpgradeable is Initializable, TRC20Upgradeable {
    function __TRC20NoReturnMock_init() internal onlyInitializing {}

    function __TRC20NoReturnMock_init_unchained() internal onlyInitializing {}
    function transfer(address to, uint256 amount) public override returns (bool) {
        // forge-lint: disable-next-line(erc20-unchecked-transfer)
        super.transfer(to, amount);
        assembly {
            return(0, 0)
        }
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        // forge-lint: disable-next-line(erc20-unchecked-transfer)
        super.transferFrom(from, to, amount);
        assembly {
            return(0, 0)
        }
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        super.approve(spender, amount);
        assembly {
            return(0, 0)
        }
    }
}
