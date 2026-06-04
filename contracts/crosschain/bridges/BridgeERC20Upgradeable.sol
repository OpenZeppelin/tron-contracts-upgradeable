// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (crosschain/bridges/BridgeERC20.sol)

pragma solidity ^0.8.26;

import {ITRC20} from "@openzeppelin/tron-contracts/contracts/token/TRC20/ITRC20.sol";
import {SafeTRC20} from "@openzeppelin/tron-contracts/contracts/token/TRC20/utils/SafeTRC20.sol";
import {BridgeFungibleUpgradeable} from "./abstract/BridgeFungibleUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev This is a variant of {BridgeFungible} that implements the bridge logic for TRC-20 tokens that do not expose a
 * crosschain mint and burn mechanism. Instead, it takes custody of bridged assets.
 */
// slither-disable-next-line locked-ether
abstract contract BridgeERC20Upgradeable is Initializable, BridgeFungibleUpgradeable {
    using SafeTRC20 for ITRC20;

    /// @custom:storage-location erc7201:openzeppelin.storage.BridgeERC20
    struct BridgeERC20Storage {
        ITRC20 _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.BridgeERC20")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BridgeERC20StorageLocation = 0x244b01c12a07f59148f0f6492b0cb67864481add66b2bb58fc6fb6ea2a07f700;

    function _getBridgeERC20Storage() private pure returns (BridgeERC20Storage storage $) {
        assembly {
            $.slot := BridgeERC20StorageLocation
        }
    }

    function __BridgeERC20_init(ITRC20 token_) internal onlyInitializing {
        __BridgeERC20_init_unchained(token_);
    }

    function __BridgeERC20_init_unchained(ITRC20 token_) internal onlyInitializing {
        BridgeERC20Storage storage $ = _getBridgeERC20Storage();
        $._token = token_;
    }

    /// @dev Return the address of the TRC20 token this bridge operates on.
    function token() public view virtual returns (ITRC20) {
        BridgeERC20Storage storage $ = _getBridgeERC20Storage();
        return $._token;
    }

    /// @dev "Locking" tokens is done by taking custody
    function _onSend(address from, uint256 amount) internal virtual override {
        token().safeTransferFrom(from, address(this), amount);
    }

    /// @dev "Unlocking" tokens is done by releasing custody
    function _onReceive(address to, uint256 amount) internal virtual override {
        token().safeTransfer(to, amount);
    }
}
