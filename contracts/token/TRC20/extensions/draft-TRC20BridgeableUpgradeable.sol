// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (token/TRC20/extensions/draft-TRC20Bridgeable.sol)

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../TRC20Upgradeable.sol";
import {TRC165Upgradeable} from "../../../utils/introspection/TRC165Upgradeable.sol";
import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {ITRC7802} from "@openzeppelin/tron-contracts/contracts/interfaces/draft-ITRC7802.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev TRC20 extension that implements the standard token interface according to
 * https://eips.ethereum.org/EIPS/eip-7802[ERC-7802].
 */
abstract contract TRC20BridgeableUpgradeable is Initializable, TRC20Upgradeable, TRC165Upgradeable, ITRC7802 {
    /// @dev Modifier to restrict access to the token bridge.
    modifier onlyTokenBridge() {
        // Token bridge should never be impersonated using a relayer/forwarder. Using msg.sender is preferable to
        // _msgSender() for security reasons.
        _checkTokenBridge(msg.sender);
        _;
    }

    function __TRC20Bridgeable_init() internal onlyInitializing {
    }

    function __TRC20Bridgeable_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc TRC165Upgradeable
    function supportsInterface(bytes4 interfaceId) public view virtual override(TRC165Upgradeable, ITRC165) returns (bool) {
        return interfaceId == type(ITRC7802).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {ITRC7802-crosschainMint}. Emits a {ITRC7802-CrosschainMint} event.
     */
    function crosschainMint(address to, uint256 value) public virtual override onlyTokenBridge {
        _mint(to, value);
        emit CrosschainMint(to, value, _msgSender());
    }

    /**
     * @dev See {ITRC7802-crosschainBurn}. Emits a {ITRC7802-CrosschainBurn} event.
     */
    function crosschainBurn(address from, uint256 value) public virtual override onlyTokenBridge {
        _burn(from, value);
        emit CrosschainBurn(from, value, _msgSender());
    }

    /**
     * @dev Checks if the caller is a trusted token bridge. MUST revert otherwise.
     *
     * Developers should implement this function using an access control mechanism that allows
     * customizing the list of allowed senders. Consider using {AccessControl} or {AccessManaged}.
     */
    function _checkTokenBridge(address caller) internal virtual;
}
