// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC1363Upgradeable} from "../../token/TRC20/extensions/TRC1363Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

// contract that replicate USDT approval behavior in approveAndCall
abstract contract TRC1363ForceApproveMockUpgradeable is Initializable, TRC1363Upgradeable {
    function __TRC1363ForceApproveMock_init() internal onlyInitializing {}

    function __TRC1363ForceApproveMock_init_unchained() internal onlyInitializing {}
    function approveAndCall(address spender, uint256 amount, bytes memory data) public virtual override returns (bool) {
        require(amount == 0 || allowance(msg.sender, spender) == 0, "USDT approval failure");
        return super.approveAndCall(spender, amount, data);
    }
}
