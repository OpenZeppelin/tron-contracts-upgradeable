// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.5.0) (utils/cryptography/verifiers/ERC7913P256Verifier.sol)

pragma solidity ^0.8.20;

import {P256Upgradeable} from "../P256Upgradeable.sol";
import {IERC7913SignatureVerifierUpgradeable} from "../../../interfaces/IERC7913Upgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev ERC-7913 signature verifier that support P256 (secp256r1) keys.
 *
 * @custom:stateless
 */
contract ERC7913P256VerifierUpgradeable is Initializable, IERC7913SignatureVerifierUpgradeable {
    function __ERC7913P256Verifier_init() internal onlyInitializing {
    }

    function __ERC7913P256Verifier_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC7913SignatureVerifierUpgradeable
    function verify(bytes calldata key, bytes32 hash, bytes calldata signature) public view virtual returns (bytes4) {
        // Signature length may be 0x40 or 0x41.
        if (key.length == 0x40 && signature.length >= 0x40) {
            bytes32 qx = bytes32(key[0x00:0x20]);
            bytes32 qy = bytes32(key[0x20:0x40]);
            bytes32 r = bytes32(signature[0x00:0x20]);
            bytes32 s = bytes32(signature[0x20:0x40]);
            if (P256Upgradeable.verify(hash, r, s, qx, qy)) {
                return IERC7913SignatureVerifierUpgradeable.verify.selector;
            }
        }
        return 0xFFFFFFFF;
    }
}
