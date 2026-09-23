// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.4.0) (token/TRC20/extensions/TRC20Capped.sol)

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../TRC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

/**
 * @dev Extension of {TRC20} that adds a cap to the supply of tokens.
 */
abstract contract TRC20CappedUpgradeable is Initializable, TRC20Upgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.TRC20Capped
    struct TRC20CappedStorage {
        uint256 _cap;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TRC20Capped")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TRC20CappedStorageLocation =
        0x8391ac74d06230773498c936b0caeffa8bdd51a9c0c5ecf43196ed825b5daa00;

    function _getTRC20CappedStorage() private pure returns (TRC20CappedStorage storage $) {
        assembly {
            $.slot := TRC20CappedStorageLocation
        }
    }

    /**
     * @dev Total supply cap has been exceeded.
     */
    error TRC20ExceededCap(uint256 increasedSupply, uint256 cap);

    /**
     * @dev The supplied cap is not a valid cap.
     */
    error TRC20InvalidCap(uint256 cap);

    /**
     * @dev Sets the value of the `cap`. This value is immutable, it can only be
     * set once during construction.
     */
    function __TRC20Capped_init(uint256 cap_) internal onlyInitializing {
        __TRC20Capped_init_unchained(cap_);
    }

    function __TRC20Capped_init_unchained(uint256 cap_) internal onlyInitializing {
        TRC20CappedStorage storage $ = _getTRC20CappedStorage();
        if (cap_ == 0) {
            revert TRC20InvalidCap(0);
        }
        $._cap = cap_;
    }

    /**
     * @dev Returns the cap on the token's total supply.
     */
    function cap() public view virtual returns (uint256) {
        TRC20CappedStorage storage $ = _getTRC20CappedStorage();
        return $._cap;
    }

    /// @inheritdoc TRC20Upgradeable
    function _update(address from, address to, uint256 value) internal virtual override {
        super._update(from, to, value);

        if (from == address(0)) {
            uint256 maxSupply = cap();
            uint256 supply = totalSupply();
            if (supply > maxSupply) {
                revert TRC20ExceededCap(supply, maxSupply);
            }
        }
    }
}
