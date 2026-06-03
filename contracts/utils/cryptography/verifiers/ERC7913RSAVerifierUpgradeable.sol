// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.5.0) (utils/cryptography/verifiers/ERC7913RSAVerifier.sol)

pragma solidity ^0.8.20;

import {RSAUpgradeable} from "../RSAUpgradeable.sol";
import {IERC7913SignatureVerifierUpgradeable} from "../../../interfaces/IERC7913Upgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev ERC-7913 signature verifier that support RSA keys.
 *
 * @custom:stateless
 */
contract ERC7913RSAVerifierUpgradeable is Initializable, IERC7913SignatureVerifierUpgradeable {
    function __ERC7913RSAVerifier_init() internal onlyInitializing {
    }

    function __ERC7913RSAVerifier_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC7913SignatureVerifierUpgradeable
    function verify(bytes calldata key, bytes32 hash, bytes calldata signature) public view virtual returns (bytes4) {
        (bytes memory e, bytes memory n) = abi.decode(key, (bytes, bytes));
        return
            RSAUpgradeable.pkcs1Sha256(abi.encodePacked(hash), signature, e, n)
                ? IERC7913SignatureVerifierUpgradeable.verify.selector
                : bytes4(0xFFFFFFFF);
    }
}
