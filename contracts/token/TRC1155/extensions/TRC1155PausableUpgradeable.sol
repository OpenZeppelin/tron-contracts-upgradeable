// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.5.0) (token/TRC1155/extensions/TRC1155Pausable.sol)

pragma solidity ^0.8.24;

import {TRC1155Upgradeable} from "../TRC1155Upgradeable.sol";
import {PausableUpgradeable} from "../../../utils/PausableUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev TRC-1155 token with pausable token transfers, minting and burning.
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
abstract contract TRC1155PausableUpgradeable is Initializable, TRC1155Upgradeable, PausableUpgradeable {
    function __TRC1155Pausable_init() internal onlyInitializing {}

    function __TRC1155Pausable_init_unchained() internal onlyInitializing {}
    /**
     * @dev See {TRC1155-_update}.
     *
     * Requirements:
     *
     * - the contract must not be paused.
     */
    function _update(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values
    ) internal virtual override whenNotPaused {
        super._update(from, to, ids, values);
    }
}
