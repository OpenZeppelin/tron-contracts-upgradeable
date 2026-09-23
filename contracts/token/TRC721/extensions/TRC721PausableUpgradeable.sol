// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.5.0) (token/TRC721/extensions/TRC721Pausable.sol)

pragma solidity ^0.8.24;

import {TRC721Upgradeable} from "../TRC721Upgradeable.sol";
import {PausableUpgradeable} from "../../../utils/PausableUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

/**
 * @dev TRC-721 token with pausable token transfers, minting and burning.
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
abstract contract TRC721PausableUpgradeable is Initializable, TRC721Upgradeable, PausableUpgradeable {
    function __TRC721Pausable_init() internal onlyInitializing {}

    function __TRC721Pausable_init_unchained() internal onlyInitializing {}
    /**
     * @dev See {TRC721-_update}.
     *
     * Requirements:
     *
     * - the contract must not be paused.
     */
    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal virtual override whenNotPaused returns (address) {
        return super._update(to, tokenId, auth);
    }
}
