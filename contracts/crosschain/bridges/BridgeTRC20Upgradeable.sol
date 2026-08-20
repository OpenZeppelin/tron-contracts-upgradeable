// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.6.0) (crosschain/bridges/BridgeTRC20.sol)

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
abstract contract BridgeTRC20Upgradeable is Initializable, BridgeFungibleUpgradeable {
    using SafeTRC20 for ITRC20;

    /// @custom:storage-location erc7201:openzeppelin.storage.BridgeTRC20
    struct BridgeTRC20Storage {
        ITRC20 _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.BridgeTRC20")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BridgeTRC20StorageLocation =
        0x6c0dc65c4916f7006acd8d36f6734088796f11ebe17a97d4bb16d728c5547200;

    function _getBridgeTRC20Storage() private pure returns (BridgeTRC20Storage storage $) {
        assembly {
            $.slot := BridgeTRC20StorageLocation
        }
    }

    function __BridgeTRC20_init(ITRC20 token_) internal onlyInitializing {
        __BridgeTRC20_init_unchained(token_);
    }

    function __BridgeTRC20_init_unchained(ITRC20 token_) internal onlyInitializing {
        BridgeTRC20Storage storage $ = _getBridgeTRC20Storage();
        $._token = token_;
    }

    /// @dev Return the address of the TRC20 token this bridge operates on.
    function token() public view virtual returns (ITRC20) {
        BridgeTRC20Storage storage $ = _getBridgeTRC20Storage();
        return $._token;
    }

    /// @dev "Locking" tokens is done by taking custody
    function _onSend(address from, uint256 amount) internal virtual override {
        token().safeTransferFrom(from, address(this), amount);
    }

    /**
     * @dev "Unlocking" tokens is done by releasing custody.
     *
     * Uses {SafeTRC20-safeTransferChecked} rather than {SafeTRC20-safeTransfer} so the release path also works
     * for tokens such as TRON USDT (`TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t`) whose `transfer` returns `false` on a
     * *successful* transfer. {safeTransfer} reverts on such a token; because locking via {_onSend}
     * (`transferFrom`, which USDT returns `true` for) still succeeds, that would let deposits through while
     * permanently trapping every withdrawal in the bridge. {safeTransferChecked} verifies success by the calling
     * contract's (sender's) balance delta and works whether the token returns `true`, `false`, or nothing.
     *
     * NOTE: This custodial bridge assumes a token that is neither rebasing nor fee-on-transfer — not because of
     * {safeTransferChecked} (which tolerates fee-on-transfer), but because taking custody in {_onSend} credits
     * the full `amount` while the contract would actually receive less, breaking release accounting. Such tokens
     * must not be bridged through this contract.
     */
    function _onReceive(address to, uint256 amount) internal virtual override {
        token().safeTransferChecked(to, amount);
    }
}
