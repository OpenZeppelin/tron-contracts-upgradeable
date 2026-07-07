// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (token/TRC6909/extensions/TRC6909ContentURI.sol)

pragma solidity ^0.8.20;

import {TRC6909Upgradeable} from "../TRC6909Upgradeable.sol";
import {ITRC6909ContentURI} from "@openzeppelin/tron-contracts/contracts/interfaces/ITRC6909.sol";
import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the Content URI extension defined in TRC6909.
 */
contract TRC6909ContentURIUpgradeable is Initializable, TRC6909Upgradeable, ITRC6909ContentURI {
    /// @custom:storage-location erc7201:openzeppelin.storage.TRC6909ContentURI
    struct TRC6909ContentURIStorage {
        string _contractURI;
        mapping(uint256 id => string) _tokenURIs;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC6909ContentURI")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC6909ContentURIStorageLocation =
        0xfccaac9e6e0e462e4bce21a44d10ffaac72c19bf1c5aa0a2afc113d70be87c00;

    function _getTRC6909ContentURIStorage() private pure returns (TRC6909ContentURIStorage storage $) {
        assembly {
            $.slot := TRC6909ContentURIStorageLocation
        }
    }

    /// @dev Event emitted when the contract URI is changed. See https://eips.ethereum.org/EIPS/eip-7572[ERC-7572] for details.
    event ContractURIUpdated();

    /// @dev See {ITRC1155-URI}
    event URI(string value, uint256 indexed id);

    function __TRC6909ContentURI_init() internal onlyInitializing {}

    function __TRC6909ContentURI_init_unchained() internal onlyInitializing {}
    /// @inheritdoc ITRC165
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(TRC6909Upgradeable, ITRC165) returns (bool) {
        return interfaceId == type(ITRC6909ContentURI).interfaceId || super.supportsInterface(interfaceId);
    }

    /// @inheritdoc ITRC6909ContentURI
    function contractURI() public view virtual override returns (string memory) {
        TRC6909ContentURIStorage storage $ = _getTRC6909ContentURIStorage();
        return $._contractURI;
    }

    /// @inheritdoc ITRC6909ContentURI
    function tokenURI(uint256 id) public view virtual override returns (string memory) {
        TRC6909ContentURIStorage storage $ = _getTRC6909ContentURIStorage();
        return $._tokenURIs[id];
    }

    /**
     * @dev Sets the {contractURI} for the contract.
     *
     * Emits a {ContractURIUpdated} event.
     */
    function _setContractURI(string memory newContractURI) internal virtual {
        TRC6909ContentURIStorage storage $ = _getTRC6909ContentURIStorage();
        $._contractURI = newContractURI;

        emit ContractURIUpdated();
    }

    /**
     * @dev Sets the {tokenURI} for a given token of type `id`.
     *
     * Emits a {URI} event.
     */
    function _setTokenURI(uint256 id, string memory newTokenURI) internal virtual {
        TRC6909ContentURIStorage storage $ = _getTRC6909ContentURIStorage();
        $._tokenURIs[id] = newTokenURI;

        emit URI(newTokenURI, id);
    }
}
