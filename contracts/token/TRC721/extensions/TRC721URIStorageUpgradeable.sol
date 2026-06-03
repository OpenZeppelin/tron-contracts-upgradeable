// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (token/TRC721/extensions/TRC721URIStorage.sol)

pragma solidity ^0.8.24;

import {TRC721Upgradeable} from "../TRC721Upgradeable.sol";
import {ITRC721MetadataUpgradeable} from "./ITRC721MetadataUpgradeable.sol";
import {IERC4906Upgradeable} from "../../../interfaces/IERC4906Upgradeable.sol";
import {IERC165Upgradeable} from "../../../interfaces/IERC165Upgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev TRC-721 token with storage based token URI management.
 */
abstract contract TRC721URIStorageUpgradeable is Initializable, IERC4906Upgradeable, TRC721Upgradeable {
    // Interface ID as defined in ERC-4906. This does not correspond to a traditional interface ID as ERC-4906 only
    // defines events and does not include any external function.
    bytes4 private constant ERC4906_INTERFACE_ID = bytes4(0x49064906);

    /// @custom:storage-location erc7201:openzeppelin.storage.TRC721URIStorage
    struct TRC721URIStorageStorage {
        // Optional mapping for token URIs
        mapping(uint256 tokenId => string) _tokenURIs;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC721URIStorage")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC721URIStorageStorageLocation = 0xe7c5d43d19a43678c6603c1fb2e1f5296ba05fda5f23b63e102eba9bf8610100;

    function _getTRC721URIStorageStorage() private pure returns (TRC721URIStorageStorage storage $) {
        assembly {
            $.slot := TRC721URIStorageStorageLocation
        }
    }

    function __TRC721URIStorage_init() internal onlyInitializing {
    }

    function __TRC721URIStorage_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC165Upgradeable
    function supportsInterface(bytes4 interfaceId) public view virtual override(TRC721Upgradeable, IERC165Upgradeable) returns (bool) {
        return interfaceId == ERC4906_INTERFACE_ID || super.supportsInterface(interfaceId);
    }

    /// @inheritdoc ITRC721MetadataUpgradeable
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory base = _baseURI();
        string memory suffix = _suffixURI(tokenId);

        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return suffix;
        }
        // If both are set, concatenate the baseURI and tokenURI (via string.concat).
        if (bytes(suffix).length > 0) {
            return string.concat(base, suffix);
        }

        return super.tokenURI(tokenId);
    }

    /**
     * @dev Sets `_tokenURI` as the tokenURI of `tokenId`.
     *
     * Emits {IERC4906-MetadataUpdate}.
     */
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        TRC721URIStorageStorage storage $ = _getTRC721URIStorageStorage();
        $._tokenURIs[tokenId] = _tokenURI;
        emit MetadataUpdate(tokenId);
    }

    /**
     * @dev Returns the suffix part of the tokenURI for `tokenId`.
     */
    function _suffixURI(uint256 tokenId) internal view virtual returns (string memory) {
        TRC721URIStorageStorage storage $ = _getTRC721URIStorageStorage();
        return $._tokenURIs[tokenId];
    }
}
