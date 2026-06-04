// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {TRC20Upgradeable} from "../../../token/TRC20/TRC20Upgradeable.sol";
import {TRC20PermitUpgradeable} from "../../../token/TRC20/extensions/TRC20PermitUpgradeable.sol";
import {TRC20VotesUpgradeable} from "../../../token/TRC20/extensions/TRC20VotesUpgradeable.sol";
import {NoncesUpgradeable} from "../../../utils/NoncesUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

contract MyTokenUpgradeable is Initializable, TRC20Upgradeable, TRC20PermitUpgradeable, TRC20VotesUpgradeable {
    function __MyToken_init() internal onlyInitializing {
        __TRC20_init_unchained("MyToken", "MTK");
        __EIP712_init_unchained("MyToken", "1");
        __TRC20Permit_init_unchained("MyToken");
    }

    function __MyToken_init_unchained() internal onlyInitializing {}

    // The functions below are overrides required by Solidity.

    function _update(address from, address to, uint256 amount) internal override(TRC20Upgradeable, TRC20VotesUpgradeable) {
        super._update(from, to, amount);
    }

    function nonces(address owner) public view virtual override(TRC20PermitUpgradeable, NoncesUpgradeable) returns (uint256) {
        return super.nonces(owner);
    }
}
