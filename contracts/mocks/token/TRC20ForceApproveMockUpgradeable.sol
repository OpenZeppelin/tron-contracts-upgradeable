// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

// contract that replicates USDT (0xdac17f958d2ee523a2206206994597c13d831ec7) approval behavior
abstract contract TRC20ForceApproveMockUpgradeable is Initializable, TRC20Upgradeable {
    function __TRC20ForceApproveMock_init() internal onlyInitializing {}

    function __TRC20ForceApproveMock_init_unchained() internal onlyInitializing {}
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        require(amount == 0 || allowance(msg.sender, spender) == 0, "USDT approval failure");
        return super.approve(spender, amount);
    }
}
