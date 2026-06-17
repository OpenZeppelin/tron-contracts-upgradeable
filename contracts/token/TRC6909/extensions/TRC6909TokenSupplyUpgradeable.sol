// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (token/TRC6909/extensions/TRC6909TokenSupply.sol)

pragma solidity ^0.8.20;

import {TRC6909Upgradeable} from "../TRC6909Upgradeable.sol";
import {ITRC6909TokenSupply} from "@openzeppelin/tron-contracts/contracts/interfaces/ITRC6909.sol";
import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the Token Supply extension defined in TRC6909.
 * Tracks the total supply of each token id individually.
 */
contract TRC6909TokenSupplyUpgradeable is Initializable, TRC6909Upgradeable, ITRC6909TokenSupply {
    /// @custom:storage-location erc7201:openzeppelin.storage.TRC6909TokenSupply
    struct TRC6909TokenSupplyStorage {
        mapping(uint256 id => uint256) _totalSupplies;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC6909TokenSupply")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC6909TokenSupplyStorageLocation = 0x45cc65fcf637f14f749687006fcd76d90179c7b5a96d43da35b61c43c7cf4c00;

    function _getTRC6909TokenSupplyStorage() private pure returns (TRC6909TokenSupplyStorage storage $) {
        assembly {
            $.slot := TRC6909TokenSupplyStorageLocation
        }
    }

    function __TRC6909TokenSupply_init() internal onlyInitializing {
    }

    function __TRC6909TokenSupply_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc ITRC6909TokenSupply
    function totalSupply(uint256 id) public view virtual override returns (uint256) {
        TRC6909TokenSupplyStorage storage $ = _getTRC6909TokenSupplyStorage();
        return $._totalSupplies[id];
    }

    /// @inheritdoc ITRC165
    function supportsInterface(bytes4 interfaceId) public view virtual override(TRC6909Upgradeable, ITRC165) returns (bool) {
        return interfaceId == type(ITRC6909TokenSupply).interfaceId || super.supportsInterface(interfaceId);
    }

    /// @dev Override the `_update` function to update the total supply of each token id as necessary.
    function _update(address from, address to, uint256 id, uint256 amount) internal virtual override {
        TRC6909TokenSupplyStorage storage $ = _getTRC6909TokenSupplyStorage();
        super._update(from, to, id, amount);

        if (from == address(0)) {
            $._totalSupplies[id] += amount;
        }
        if (to == address(0)) {
            unchecked {
                // amount <= _balances[from][id] <= _totalSupplies[id]
                $._totalSupplies[id] -= amount;
            }
        }
    }
}
