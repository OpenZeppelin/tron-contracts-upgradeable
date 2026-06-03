// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.5.0) (token/TRC1155/utils/TRC1155Holder.sol)

pragma solidity ^0.8.20;

import {IERC165Upgradeable, ERC165Upgradeable} from "../../../utils/introspection/ERC165Upgradeable.sol";
import {ITRC1155ReceiverUpgradeable} from "../ITRC1155ReceiverUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev Simple implementation of `ITRC1155Receiver` that will allow a contract to hold TRC-1155 tokens.
 *
 * IMPORTANT: When inheriting this contract, you must include a way to use the received tokens, otherwise they will be
 * stuck.
 *
 * @custom:stateless
 */
abstract contract TRC1155HolderUpgradeable is Initializable, ERC165Upgradeable, ITRC1155ReceiverUpgradeable {
    function __TRC1155Holder_init() internal onlyInitializing {
    }

    function __TRC1155Holder_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC165Upgradeable
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165Upgradeable, IERC165Upgradeable) returns (bool) {
        return interfaceId == type(ITRC1155ReceiverUpgradeable).interfaceId || super.supportsInterface(interfaceId);
    }

    function onERC1155Received(
        address,
        address,
        uint256,
        uint256,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC1155Received.selector;
    }

    function onERC1155BatchReceived(
        address,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC1155BatchReceived.selector;
    }
}
