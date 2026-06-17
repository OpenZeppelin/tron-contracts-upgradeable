// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (utils/introspection/TRC165.sol)

pragma solidity ^0.8.20;

import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the {ITRC165} interface.
 *
 * Contracts that want to implement TRC-165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 */
abstract contract TRC165Upgradeable is Initializable, ITRC165 {
    function __TRC165_init() internal onlyInitializing {
    }

    function __TRC165_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc ITRC165
    function supportsInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(ITRC165).interfaceId;
    }
}
