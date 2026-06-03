// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ITRC20Upgradeable, TRC20Upgradeable} from "../../../token/TRC20/TRC20Upgradeable.sol";
import {TRC20PermitUpgradeable} from "../../../token/TRC20/extensions/TRC20PermitUpgradeable.sol";
import {TRC20VotesUpgradeable} from "../../../token/TRC20/extensions/TRC20VotesUpgradeable.sol";
import {TRC20WrapperUpgradeable} from "../../../token/TRC20/extensions/TRC20WrapperUpgradeable.sol";
import {NoncesUpgradeable} from "../../../utils/NoncesUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract MyTokenWrappedUpgradeable is Initializable, TRC20Upgradeable, TRC20PermitUpgradeable, TRC20VotesUpgradeable, TRC20WrapperUpgradeable {
    function __MyTokenWrapped_init(
        ITRC20Upgradeable wrappedToken
    ) internal onlyInitializing {
        __TRC20_init_unchained("MyTokenWrapped", "MTK");
        __EIP712_init_unchained("MyTokenWrapped", "1");
        __TRC20Permit_init_unchained("MyTokenWrapped");
        __TRC20Wrapper_init_unchained(wrappedToken);
    }

    function __MyTokenWrapped_init_unchained(
        ITRC20Upgradeable
    ) internal onlyInitializing {}

    // The functions below are overrides required by Solidity.

    function decimals() public view override(TRC20Upgradeable, TRC20WrapperUpgradeable) returns (uint8) {
        return super.decimals();
    }

    function _update(address from, address to, uint256 amount) internal override(TRC20Upgradeable, TRC20VotesUpgradeable) {
        super._update(from, to, amount);
    }

    function nonces(address owner) public view virtual override(TRC20PermitUpgradeable, NoncesUpgradeable) returns (uint256) {
        return super.nonces(owner);
    }
}
