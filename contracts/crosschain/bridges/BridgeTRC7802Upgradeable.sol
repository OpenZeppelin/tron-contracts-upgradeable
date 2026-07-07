// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (crosschain/bridges/BridgeTRC7802.sol)

pragma solidity ^0.8.26;

import {ITRC7802} from "@openzeppelin/tron-contracts/contracts/interfaces/draft-ITRC7802.sol";
import {BridgeFungibleUpgradeable} from "./abstract/BridgeFungibleUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev This is a variant of {BridgeFungible} that implements the bridge logic for ERC-7802 compliant tokens.
 */
// slither-disable-next-line locked-ether
abstract contract BridgeTRC7802Upgradeable is Initializable, BridgeFungibleUpgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.BridgeTRC7802
    struct BridgeTRC7802Storage {
        ITRC7802 _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.BridgeTRC7802")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BridgeTRC7802StorageLocation =
        0xcf35197a3f2e8f4af83d4d392549137b03573a4b32ae69d22ad1d6eae8de1e00;

    function _getBridgeTRC7802Storage() private pure returns (BridgeTRC7802Storage storage $) {
        assembly {
            $.slot := BridgeTRC7802StorageLocation
        }
    }

    function __BridgeTRC7802_init(ITRC7802 token_) internal onlyInitializing {
        __BridgeTRC7802_init_unchained(token_);
    }

    function __BridgeTRC7802_init_unchained(ITRC7802 token_) internal onlyInitializing {
        BridgeTRC7802Storage storage $ = _getBridgeTRC7802Storage();
        $._token = token_;
    }

    /// @dev Return the address of the TRC20 token this bridge operates on.
    function token() public view virtual returns (ITRC7802) {
        BridgeTRC7802Storage storage $ = _getBridgeTRC7802Storage();
        return $._token;
    }

    /// @dev "Locking" tokens using an ERC-7802 crosschain burn
    function _onSend(address from, uint256 amount) internal virtual override {
        token().crosschainBurn(from, amount);
    }

    /// @dev "Unlocking" tokens using an ERC-7802 crosschain mint
    function _onReceive(address to, uint256 amount) internal virtual override {
        token().crosschainMint(to, amount);
    }
}
