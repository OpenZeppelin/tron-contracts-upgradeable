// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (token/TRC6909/extensions/TRC6909Metadata.sol)

pragma solidity ^0.8.20;

import {TRC6909Upgradeable} from "../TRC6909Upgradeable.sol";
import {ITRC6909Metadata} from "@openzeppelin/tron-contracts/contracts/interfaces/ITRC6909.sol";
import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the Metadata extension defined in TRC6909. Exposes the name, symbol, and decimals of each token id.
 */
contract TRC6909MetadataUpgradeable is Initializable, TRC6909Upgradeable, ITRC6909Metadata {
    struct TokenMetadata {
        string name;
        string symbol;
        uint8 decimals;
    }

    /// @custom:storage-location erc7201:openzeppelin.storage.TRC6909Metadata
    struct TRC6909MetadataStorage {
        mapping(uint256 id => TokenMetadata) _tokenMetadata;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC6909Metadata")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC6909MetadataStorageLocation = 0x5d3cdfc8b49195da6280952caa2aadb1d709d06d576f9ee6ceaf35fb83cc9000;

    function _getTRC6909MetadataStorage() private pure returns (TRC6909MetadataStorage storage $) {
        assembly {
            $.slot := TRC6909MetadataStorageLocation
        }
    }

    /// @dev The name of the token of type `id` was updated to `newName`.
    event TRC6909NameUpdated(uint256 indexed id, string newName);

    /// @dev The symbol for the token of type `id` was updated to `newSymbol`.
    event TRC6909SymbolUpdated(uint256 indexed id, string newSymbol);

    /// @dev The decimals value for token of type `id` was updated to `newDecimals`.
    event TRC6909DecimalsUpdated(uint256 indexed id, uint8 newDecimals);

    function __TRC6909Metadata_init() internal onlyInitializing {
    }

    function __TRC6909Metadata_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc ITRC6909Metadata
    function name(uint256 id) public view virtual override returns (string memory) {
        TRC6909MetadataStorage storage $ = _getTRC6909MetadataStorage();
        return $._tokenMetadata[id].name;
    }

    /// @inheritdoc ITRC6909Metadata
    function symbol(uint256 id) public view virtual override returns (string memory) {
        TRC6909MetadataStorage storage $ = _getTRC6909MetadataStorage();
        return $._tokenMetadata[id].symbol;
    }

    /// @inheritdoc ITRC6909Metadata
    function decimals(uint256 id) public view virtual override returns (uint8) {
        TRC6909MetadataStorage storage $ = _getTRC6909MetadataStorage();
        return $._tokenMetadata[id].decimals;
    }

    /// @inheritdoc ITRC165
    function supportsInterface(bytes4 interfaceId) public view virtual override(TRC6909Upgradeable, ITRC165) returns (bool) {
        return interfaceId == type(ITRC6909Metadata).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev Sets the `name` for a given token of type `id`.
     *
     * Emits an {TRC6909NameUpdated} event.
     */
    function _setName(uint256 id, string memory newName) internal virtual {
        TRC6909MetadataStorage storage $ = _getTRC6909MetadataStorage();
        $._tokenMetadata[id].name = newName;

        emit TRC6909NameUpdated(id, newName);
    }

    /**
     * @dev Sets the `symbol` for a given token of type `id`.
     *
     * Emits an {TRC6909SymbolUpdated} event.
     */
    function _setSymbol(uint256 id, string memory newSymbol) internal virtual {
        TRC6909MetadataStorage storage $ = _getTRC6909MetadataStorage();
        $._tokenMetadata[id].symbol = newSymbol;

        emit TRC6909SymbolUpdated(id, newSymbol);
    }

    /**
     * @dev Sets the `decimals` for a given token of type `id`.
     *
     * Emits an {TRC6909DecimalsUpdated} event.
     */
    function _setDecimals(uint256 id, uint8 newDecimals) internal virtual {
        TRC6909MetadataStorage storage $ = _getTRC6909MetadataStorage();
        $._tokenMetadata[id].decimals = newDecimals;

        emit TRC6909DecimalsUpdated(id, newDecimals);
    }
}
