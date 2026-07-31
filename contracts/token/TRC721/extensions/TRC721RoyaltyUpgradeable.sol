// SPDX-License-Identifier: MIT
// Tron Contracts (last updated v5.5.0) (token/TRC721/extensions/TRC721Royalty.sol)

pragma solidity ^0.8.24;

import {TRC721Upgradeable} from "../TRC721Upgradeable.sol";
import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {TRC2981Upgradeable} from "../../common/TRC2981Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Extension of TRC-721 with the TRC-2981 NFT Royalty Standard, a standardized way to retrieve royalty payment
 * information.
 *
 * Royalty information can be specified globally for all token ids via {TRC2981-_setDefaultRoyalty}, and/or individually
 * for specific token ids via {TRC2981-_setTokenRoyalty}. The latter takes precedence over the first.
 *
 * IMPORTANT: TRC-2981 only specifies a way to signal royalty information and does not enforce its payment. See
 * https://eips.ethereum.org/EIPS/eip-2981#optional-royalty-payments[Rationale] in the ERC. Marketplaces are expected to
 * voluntarily pay royalties together with sales, but note that this standard is not yet widely supported.
 */
abstract contract TRC721RoyaltyUpgradeable is Initializable, TRC2981Upgradeable, TRC721Upgradeable {
    function __TRC721Royalty_init() internal onlyInitializing {}

    function __TRC721Royalty_init_unchained() internal onlyInitializing {}
    /// @inheritdoc ITRC165
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(TRC721Upgradeable, TRC2981Upgradeable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
