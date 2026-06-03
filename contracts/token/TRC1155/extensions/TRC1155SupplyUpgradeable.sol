// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (token/TRC1155/extensions/TRC1155Supply.sol)

pragma solidity ^0.8.24;

import {TRC1155Upgradeable} from "../TRC1155Upgradeable.sol";
import {ArraysUpgradeable} from "../../../utils/ArraysUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev Extension of TRC-1155 that adds tracking of total supply per id.
 *
 * Useful for scenarios where Fungible and Non-fungible tokens have to be
 * clearly identified. Note: While a `totalSupply` of 1 may mean the
 * corresponding token is an NFT, there are no inherent guarantees that
 * no more tokens with the same id will be minted in future.
 *
 * NOTE: This contract implies a global limit of 2**256 - 1 to the number of tokens
 * that can be minted.
 *
 * CAUTION: This extension should not be added in an upgrade to an already deployed contract.
 */
abstract contract TRC1155SupplyUpgradeable is Initializable, TRC1155Upgradeable {
    using ArraysUpgradeable for uint256[];

    /// @custom:storage-location erc7201:openzeppelin.storage.TRC1155Supply
    struct TRC1155SupplyStorage {
        mapping(uint256 id => uint256) _totalSupply;
        uint256 _totalSupplyAll;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC1155Supply")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC1155SupplyStorageLocation = 0xf536c51e65f37217406c6c8e23c50e1b94a87db372ee6ac03cd675e091171e00;

    function _getTRC1155SupplyStorage() private pure returns (TRC1155SupplyStorage storage $) {
        assembly {
            $.slot := TRC1155SupplyStorageLocation
        }
    }

    function __TRC1155Supply_init() internal onlyInitializing {
    }

    function __TRC1155Supply_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev Total value of tokens with a given id.
     */
    function totalSupply(uint256 id) public view virtual returns (uint256) {
        TRC1155SupplyStorage storage $ = _getTRC1155SupplyStorage();
        return $._totalSupply[id];
    }

    /**
     * @dev Total value of tokens.
     */
    function totalSupply() public view virtual returns (uint256) {
        TRC1155SupplyStorage storage $ = _getTRC1155SupplyStorage();
        return $._totalSupplyAll;
    }

    /**
     * @dev Indicates whether any tokens exist with a given id, or not.
     */
    function exists(uint256 id) public view virtual returns (bool) {
        return totalSupply(id) > 0;
    }

    /// @inheritdoc TRC1155Upgradeable
    function _update(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values
    ) internal virtual override {
        TRC1155SupplyStorage storage $ = _getTRC1155SupplyStorage();
        super._update(from, to, ids, values);

        if (from == address(0)) {
            uint256 totalMintValue = 0;
            for (uint256 i = 0; i < ids.length; ++i) {
                uint256 value = values.unsafeMemoryAccess(i);
                // Overflow check required: The rest of the code assumes that totalSupply never overflows
                $._totalSupply[ids.unsafeMemoryAccess(i)] += value;
                totalMintValue += value;
            }
            // Overflow check required: The rest of the code assumes that totalSupplyAll never overflows
            $._totalSupplyAll += totalMintValue;
        }

        if (to == address(0)) {
            uint256 totalBurnValue = 0;
            for (uint256 i = 0; i < ids.length; ++i) {
                uint256 value = values.unsafeMemoryAccess(i);

                unchecked {
                    // Overflow not possible: values[i] <= balanceOf(from, ids[i]) <= totalSupply(ids[i])
                    $._totalSupply[ids.unsafeMemoryAccess(i)] -= value;
                    // Overflow not possible: sum_i(values[i]) <= sum_i(totalSupply(ids[i])) <= totalSupplyAll
                    totalBurnValue += value;
                }
            }
            unchecked {
                // Overflow not possible: totalBurnValue = sum_i(values[i]) <= sum_i(totalSupply(ids[i])) <= totalSupplyAll
                $._totalSupplyAll -= totalBurnValue;
            }
        }
    }
}
