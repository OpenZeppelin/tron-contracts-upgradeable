// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (token/common/TRC2981.sol)

pragma solidity ^0.8.20;

import {ITRC2981} from "@openzeppelin/tron-contracts/contracts/interfaces/ITRC2981.sol";
import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {TRC165Upgradeable} from "../../utils/introspection/TRC165Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the NFT Royalty Standard, a standardized way to retrieve royalty payment information.
 *
 * Royalty information can be specified globally for all token ids via {_setDefaultRoyalty}, and/or individually for
 * specific token ids via {_setTokenRoyalty}. The latter takes precedence over the first.
 *
 * Royalty is specified as a fraction of sale price. {_feeDenominator} is overridable but defaults to 10000, meaning the
 * fee is specified in basis points by default.
 *
 * IMPORTANT: ERC-2981 only specifies a way to signal royalty information and does not enforce its payment. See
 * https://eips.ethereum.org/EIPS/eip-2981#optional-royalty-payments[Rationale] in the ERC. Marketplaces are expected to
 * voluntarily pay royalties together with sales, but note that this standard is not yet widely supported.
 */
abstract contract TRC2981Upgradeable is Initializable, ITRC2981, TRC165Upgradeable {
    struct RoyaltyInfo {
        address receiver;
        uint96 royaltyFraction;
    }

    /// @custom:storage-location erc7201:openzeppelin.storage.TRC2981
    struct TRC2981Storage {
        RoyaltyInfo _defaultRoyaltyInfo;
        mapping(uint256 tokenId => RoyaltyInfo) _tokenRoyaltyInfo;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC2981")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC2981StorageLocation = 0x040486b52aec0da9656248119d88c68b08f1a00cad7e35e2cfe8802acce16000;

    function _getTRC2981Storage() private pure returns (TRC2981Storage storage $) {
        assembly {
            $.slot := TRC2981StorageLocation
        }
    }

    /**
     * @dev The default royalty set is invalid (eg. (numerator / denominator) >= 1).
     */
    error TRC2981InvalidDefaultRoyalty(uint256 numerator, uint256 denominator);

    /**
     * @dev The default royalty receiver is invalid.
     */
    error TRC2981InvalidDefaultRoyaltyReceiver(address receiver);

    /**
     * @dev The royalty set for a specific `tokenId` is invalid (eg. (numerator / denominator) >= 1).
     */
    error TRC2981InvalidTokenRoyalty(uint256 tokenId, uint256 numerator, uint256 denominator);

    /**
     * @dev The royalty receiver for `tokenId` is invalid.
     */
    error TRC2981InvalidTokenRoyaltyReceiver(uint256 tokenId, address receiver);

    function __TRC2981_init() internal onlyInitializing {
    }

    function __TRC2981_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc ITRC165
    function supportsInterface(bytes4 interfaceId) public view virtual override(ITRC165, TRC165Upgradeable) returns (bool) {
        return interfaceId == type(ITRC2981).interfaceId || super.supportsInterface(interfaceId);
    }

    /// @inheritdoc ITRC2981
    function royaltyInfo(
        uint256 tokenId,
        uint256 salePrice
    ) public view virtual returns (address receiver, uint256 amount) {
        TRC2981Storage storage $ = _getTRC2981Storage();
        RoyaltyInfo storage _royaltyInfo = $._tokenRoyaltyInfo[tokenId];
        address royaltyReceiver = _royaltyInfo.receiver;
        uint96 royaltyFraction = _royaltyInfo.royaltyFraction;

        if (royaltyReceiver == address(0)) {
            royaltyReceiver = $._defaultRoyaltyInfo.receiver;
            royaltyFraction = $._defaultRoyaltyInfo.royaltyFraction;
        }

        uint256 royaltyAmount = (salePrice * royaltyFraction) / _feeDenominator();

        return (royaltyReceiver, royaltyAmount);
    }

    /**
     * @dev The denominator with which to interpret the fee set in {_setTokenRoyalty} and {_setDefaultRoyalty} as a
     * fraction of the sale price. Defaults to 10000 so fees are expressed in basis points, but may be customized by an
     * override.
     */
    function _feeDenominator() internal pure virtual returns (uint96) {
        return 10000;
    }

    /**
     * @dev Sets the royalty information that all ids in this contract will default to.
     *
     * Requirements:
     *
     * - `receiver` cannot be the zero address.
     * - `feeNumerator` cannot be greater than the fee denominator.
     */
    function _setDefaultRoyalty(address receiver, uint96 feeNumerator) internal virtual {
        TRC2981Storage storage $ = _getTRC2981Storage();
        uint256 denominator = _feeDenominator();
        if (feeNumerator > denominator) {
            // Royalty fee will exceed the sale price
            revert TRC2981InvalidDefaultRoyalty(feeNumerator, denominator);
        }
        if (receiver == address(0)) {
            revert TRC2981InvalidDefaultRoyaltyReceiver(address(0));
        }

        $._defaultRoyaltyInfo = RoyaltyInfo(receiver, feeNumerator);
    }

    /**
     * @dev Removes default royalty information.
     */
    function _deleteDefaultRoyalty() internal virtual {
        TRC2981Storage storage $ = _getTRC2981Storage();
        delete $._defaultRoyaltyInfo;
    }

    /**
     * @dev Sets the royalty information for a specific token id, overriding the global default.
     *
     * Requirements:
     *
     * - `receiver` cannot be the zero address.
     * - `feeNumerator` cannot be greater than the fee denominator.
     */
    function _setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator) internal virtual {
        TRC2981Storage storage $ = _getTRC2981Storage();
        uint256 denominator = _feeDenominator();
        if (feeNumerator > denominator) {
            // Royalty fee will exceed the sale price
            revert TRC2981InvalidTokenRoyalty(tokenId, feeNumerator, denominator);
        }
        if (receiver == address(0)) {
            revert TRC2981InvalidTokenRoyaltyReceiver(tokenId, address(0));
        }

        $._tokenRoyaltyInfo[tokenId] = RoyaltyInfo(receiver, feeNumerator);
    }

    /**
     * @dev Resets royalty information for the token id back to the global default.
     */
    function _resetTokenRoyalty(uint256 tokenId) internal virtual {
        TRC2981Storage storage $ = _getTRC2981Storage();
        delete $._tokenRoyaltyInfo[tokenId];
    }
}
