// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.7.0-rc.0) (token/TRC721/extensions/TRC721Crosschain.sol)

pragma solidity ^0.8.26;

import {TRC721Upgradeable} from "../TRC721Upgradeable.sol";
import {BridgeNonFungibleUpgradeable} from "../../../crosschain/bridges/abstract/BridgeNonFungibleUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

/**
 * @dev Extension of {TRC721} that makes it natively cross-chain using the TRC-7786 based {BridgeNonFungible}.
 *
 * This extension makes the token compatible with:
 * * {TRC721Crosschain} instances on other chains,
 * * {TRC721} instances on other chains that are bridged using {BridgeTRC721},
 */
// slither-disable-next-line locked-ether
abstract contract TRC721CrosschainUpgradeable is Initializable, BridgeNonFungibleUpgradeable, TRC721Upgradeable {
    function __TRC721Crosschain_init() internal onlyInitializing {}

    function __TRC721Crosschain_init_unchained() internal onlyInitializing {}
    /// @dev Crosschain variant of {transferFrom}, using the allowance system from the underlying TRC-721 token.
    function crosschainTransferFrom(address from, bytes memory to, uint256 tokenId) public virtual returns (bytes32) {
        // operator (_msgSender) permission over `from` is checked in `_onSend`
        return _crosschainTransfer(from, to, tokenId);
    }

    /// @dev "Locking" tokens is achieved through burning
    function _onSend(address from, uint256 tokenId) internal virtual override {
        address previousOwner = _update(address(0), tokenId, _msgSender());
        if (previousOwner == address(0)) {
            revert TRC721NonexistentToken(tokenId);
        } else if (previousOwner != from) {
            revert TRC721IncorrectOwner(from, tokenId, previousOwner);
        }
    }

    /// @dev "Unlocking" tokens is achieved through minting
    function _onReceive(address to, uint256 tokenId) internal virtual override {
        _mint(to, tokenId);
    }
}
