// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (token/TRC20/extensions/TRC20Pausable.sol)

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../TRC20Upgradeable.sol";
import {PausableUpgradeable} from "../../../utils/PausableUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev TRC-20 token with pausable token transfers, minting and burning.
 *
 * Useful for scenarios such as preventing trades until the end of an evaluation
 * period, or having an emergency switch for freezing all token transfers in the
 * event of a large bug.
 *
 * IMPORTANT: This contract does not include public pause and unpause functions. In
 * addition to inheriting this contract, you must define both functions, invoking the
 * {Pausable-_pause} and {Pausable-_unpause} internal functions, with appropriate
 * access control, e.g. using {AccessControl} or {Ownable}. Not doing so will
 * make the contract pause mechanism of the contract unreachable, and thus unusable.
 */
abstract contract TRC20PausableUpgradeable is Initializable, TRC20Upgradeable, PausableUpgradeable {
    function __TRC20Pausable_init() internal onlyInitializing {
    }

    function __TRC20Pausable_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev See {TRC20-_update}.
     *
     * Requirements:
     *
     * - the contract must not be paused.
     */
    function _update(address from, address to, uint256 value) internal virtual override whenNotPaused {
        super._update(from, to, value);
    }
}
