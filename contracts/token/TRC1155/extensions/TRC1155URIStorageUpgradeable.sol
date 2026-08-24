// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.6.0) (token/TRC1155/extensions/TRC1155URIStorage.sol)

pragma solidity ^0.8.24;

import {TRC1155Upgradeable} from "../TRC1155Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

/**
 * @dev TRC-1155 token with storage based token URI management.
 * Inspired by the {TRC721URIStorage} extension
 */
abstract contract TRC1155URIStorageUpgradeable is Initializable, TRC1155Upgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.TRC1155URIStorage
    struct TRC1155URIStorageStorage {
        // Optional base URI
        string _baseURI;
        // Optional mapping for token URIs
        mapping(uint256 tokenId => string) _tokenURIs;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC1155URIStorage")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC1155URIStorageStorageLocation =
        0x3bfc10e699d514b04df65e70acf24d06e77bc15c9922a44f7618866513b28900;

    function _getTRC1155URIStorageStorage() private pure returns (TRC1155URIStorageStorage storage $) {
        assembly {
            $.slot := TRC1155URIStorageStorageLocation
        }
    }

    function __TRC1155URIStorage_init() internal onlyInitializing {
        __TRC1155URIStorage_init_unchained();
    }

    function __TRC1155URIStorage_init_unchained() internal onlyInitializing {
        TRC1155URIStorageStorage storage $ = _getTRC1155URIStorageStorage();
        $._baseURI = "";
    }
    /**
     * @dev See {ITRC1155MetadataURI-uri}.
     *
     * This implementation returns the concatenation of the `_baseURI`
     * and the token-specific uri if the latter is set
     *
     * This enables the following behaviors:
     *
     * - if `_tokenURIs[tokenId]` is set, then the result is the concatenation
     *   of `_baseURI` and `_tokenURIs[tokenId]` (keep in mind that `_baseURI`
     *   is empty per default);
     *
     * - if `_tokenURIs[tokenId]` is NOT set then we fallback to `super.uri()`
     *   which in most cases will contain `TRC1155._uri`;
     *
     * - if `_tokenURIs[tokenId]` is NOT set, and if the parents do not have a
     *   uri value set, then the result is empty.
     */
    function uri(uint256 tokenId) public view virtual override returns (string memory) {
        TRC1155URIStorageStorage storage $ = _getTRC1155URIStorageStorage();
        string memory tokenURI = $._tokenURIs[tokenId];

        // If token URI is set, concatenate base URI and tokenURI (via string.concat).
        return bytes(tokenURI).length > 0 ? string.concat($._baseURI, tokenURI) : super.uri(tokenId);
    }

    /**
     * @dev Sets `tokenURI` as the tokenURI of `tokenId`.
     */
    function _setURI(uint256 tokenId, string memory tokenURI) internal virtual {
        TRC1155URIStorageStorage storage $ = _getTRC1155URIStorageStorage();
        $._tokenURIs[tokenId] = tokenURI;
        emit URI(uri(tokenId), tokenId);
    }

    /**
     * @dev Sets `baseURI` as the `_baseURI` for all tokens
     */
    function _setBaseURI(string memory baseURI) internal virtual {
        TRC1155URIStorageStorage storage $ = _getTRC1155URIStorageStorage();
        $._baseURI = baseURI;
    }
}
