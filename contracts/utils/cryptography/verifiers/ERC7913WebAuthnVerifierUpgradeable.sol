// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (utils/cryptography/verifiers/ERC7913WebAuthnVerifier.sol)

pragma solidity ^0.8.24;

import {WebAuthnUpgradeable} from "../WebAuthnUpgradeable.sol";
import {IERC7913SignatureVerifierUpgradeable} from "../../../interfaces/IERC7913Upgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev ERC-7913 signature verifier that supports WebAuthn authentication assertions.
 *
 * This verifier enables the validation of WebAuthn signatures using P256 public keys.
 * The key is expected to be a 64-byte concatenation of the P256 public key coordinates (qx || qy).
 * The signature is expected to be an abi-encoded {WebAuthn-WebAuthnAuth} struct.
 *
 * Uses {WebAuthn-verify} for signature verification, which performs the essential
 * WebAuthn checks: type validation, challenge matching, and cryptographic signature verification.
 *
 * NOTE: Wallets that may require default P256 validation may install a P256 verifier separately.
 *
 * @custom:stateless
 */
contract ERC7913WebAuthnVerifierUpgradeable is Initializable, IERC7913SignatureVerifierUpgradeable {
    function __ERC7913WebAuthnVerifier_init() internal onlyInitializing {
    }

    function __ERC7913WebAuthnVerifier_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC7913SignatureVerifierUpgradeable
    function verify(bytes calldata key, bytes32 hash, bytes calldata signature) public view virtual returns (bytes4) {
        (bool decodeSuccess, WebAuthnUpgradeable.WebAuthnAuth calldata auth) = WebAuthnUpgradeable.tryDecodeAuth(signature);

        return
            decodeSuccess &&
                key.length == 0x40 &&
                WebAuthnUpgradeable.verify(abi.encodePacked(hash), auth, bytes32(key[0x00:0x20]), bytes32(key[0x20:0x40]))
                ? IERC7913SignatureVerifierUpgradeable.verify.selector
                : bytes4(0xFFFFFFFF);
    }
}
