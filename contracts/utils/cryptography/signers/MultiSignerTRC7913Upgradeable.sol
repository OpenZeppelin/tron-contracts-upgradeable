// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.6.0) (utils/cryptography/signers/MultiSignerTRC7913.sol)

pragma solidity ^0.8.26;

import {AbstractSigner} from "@openzeppelin/tron-contracts/utils/cryptography/signers/AbstractSigner.sol";
import {SignatureChecker} from "@openzeppelin/tron-contracts/utils/cryptography/SignatureChecker.sol";
import {EnumerableSet} from "@openzeppelin/tron-contracts/utils/structs/EnumerableSet.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of {AbstractSigner} using multiple TRC-7913 signers with a threshold-based
 * signature verification system.
 *
 * This contract allows managing a set of authorized signers and requires a minimum number of
 * signatures (threshold) to approve operations. It uses TRC-7913 formatted signers, which
 * makes it natively compatible with ECDSA and TRC-1271 signers.
 *
 * Example of usage:
 *
 * ```solidity
 * contract MyMultiSignerAccount is Account, MultiSignerTRC7913, Initializable {
 *     function initialize(bytes[] memory signers, uint64 threshold) public initializer {
 *         _addSigners(signers);
 *         _setThreshold(threshold);
 *     }
 *
 *     function addSigners(bytes[] memory signers) public onlyEntryPointOrSelf {
 *         _addSigners(signers);
 *     }
 *
 *     function removeSigners(bytes[] memory signers) public onlyEntryPointOrSelf {
 *         _removeSigners(signers);
 *     }
 *
 *     function setThreshold(uint64 threshold) public onlyEntryPointOrSelf {
 *         _setThreshold(threshold);
 *     }
 * }
 * ```
 *
 * IMPORTANT: Failing to properly initialize the signers and threshold either during construction
 * (if used standalone) or during initialization (if used as a clone) may leave the contract
 * either front-runnable or unusable.
 */
abstract contract MultiSignerTRC7913Upgradeable is Initializable, AbstractSigner {
    using EnumerableSet for EnumerableSet.BytesSet;
    using SignatureChecker for *;

    /// @custom:storage-location erc7201:openzeppelin.storage.MultiSignerTRC7913
    struct MultiSignerTRC7913Storage {
        EnumerableSet.BytesSet _signers;
        uint64 _threshold;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.MultiSignerTRC7913")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant MultiSignerTRC7913StorageLocation =
        0x1e2d6dae973eb235164e3a632e81ab42ad5c7b04ecb1e44573bc8dcd71c98700;

    function _getMultiSignerTRC7913Storage() private pure returns (MultiSignerTRC7913Storage storage $) {
        assembly {
            $.slot := MultiSignerTRC7913StorageLocation
        }
    }

    /// @dev Emitted when a signer is added.
    event TRC7913SignerAdded(bytes indexed signers);

    /// @dev Emitted when a signers is removed.
    event TRC7913SignerRemoved(bytes indexed signers);

    /// @dev Emitted when the threshold is updated.
    event TRC7913ThresholdSet(uint64 threshold);

    /// @dev The `signer` already exists.
    error MultiSignerTRC7913AlreadyExists(bytes signer);

    /// @dev The `signer` does not exist.
    error MultiSignerTRC7913NonexistentSigner(bytes signer);

    /// @dev The `signer` is less than 20 bytes long.
    error MultiSignerTRC7913InvalidSigner(bytes signer);

    /// @dev The `threshold` is zero.
    error MultiSignerTRC7913ZeroThreshold();

    /// @dev The `threshold` is unreachable given the number of `signers`.
    error MultiSignerTRC7913UnreachableThreshold(uint64 signers, uint64 threshold);

    function __MultiSignerTRC7913_init(bytes[] memory signers_, uint64 threshold_) internal onlyInitializing {
        __MultiSignerTRC7913_init_unchained(signers_, threshold_);
    }

    function __MultiSignerTRC7913_init_unchained(bytes[] memory signers_, uint64 threshold_) internal onlyInitializing {
        _addSigners(signers_);
        _setThreshold(threshold_);
    }

    /**
     * @dev Returns a slice of the set of authorized signers.
     *
     * Using `start = 0` and `end = type(uint64).max` will return the entire set of signers.
     *
     * WARNING: Depending on the `start` and `end`, this operation can copy a large amount of data to memory, which
     * can be expensive. This is designed for view accessors queried without gas fees. Using it in state-changing
     * functions may become uncallable if the slice grows too large.
     */
    function getSigners(uint64 start, uint64 end) public view virtual returns (bytes[] memory) {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        return $._signers.values(start, end);
    }

    /// @dev Returns the number of authorized signers
    function getSignerCount() public view virtual returns (uint256) {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        return $._signers.length();
    }

    /// @dev Returns whether the `signer` is an authorized signer.
    function isSigner(bytes memory signer) public view virtual returns (bool) {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        return $._signers.contains(signer);
    }

    /// @dev Returns the minimum number of signers required to approve a multisignature operation.
    function threshold() public view virtual returns (uint64) {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        return $._threshold;
    }

    /**
     * @dev Adds the `newSigners` to those allowed to sign on behalf of this contract.
     * Internal version without access control.
     *
     * Requirements:
     *
     * * Each of `newSigners` must be at least 20 bytes long. Reverts with {MultiSignerTRC7913InvalidSigner} if not.
     * * Each of `newSigners` must not be authorized. See {isSigner}. Reverts with {MultiSignerTRC7913AlreadyExists} if so.
     *
     * NOTE: This function does not validate that signers are controlled or represent appropriate entities. Integrators
     * must ensure signers are properly validated before adding them. Problematic signers can compromise
     * the multisig's security or functionality. Examples include uncontrolled addresses (e.g., `address(0)`),
     * the account's own address (which may cause recursive validation loops), or contracts that may unintentionally
     * allow arbitrary validation (e.g. using the identity precompile at `address(0x04)`, which would return the
     * TRC-1271 magic value for any `isValidSignature` call).
     */
    function _addSigners(bytes[] memory newSigners) internal virtual {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        for (uint256 i = 0; i < newSigners.length; ++i) {
            bytes memory signer = newSigners[i];
            require(signer.length >= 20, MultiSignerTRC7913InvalidSigner(signer));
            require($._signers.add(signer), MultiSignerTRC7913AlreadyExists(signer));
            emit TRC7913SignerAdded(signer);
        }
    }

    /**
     * @dev Removes the `oldSigners` from the authorized signers. Internal version without access control.
     *
     * Requirements:
     *
     * * Each of `oldSigners` must be authorized. See {isSigner}. Otherwise {MultiSignerTRC7913NonexistentSigner} is thrown.
     * * See {_validateReachableThreshold} for the threshold validation.
     */
    function _removeSigners(bytes[] memory oldSigners) internal virtual {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        for (uint256 i = 0; i < oldSigners.length; ++i) {
            bytes memory signer = oldSigners[i];
            require($._signers.remove(signer), MultiSignerTRC7913NonexistentSigner(signer));
            emit TRC7913SignerRemoved(signer);
        }
        _validateReachableThreshold();
    }

    /**
     * @dev Sets the signatures `threshold` required to approve a multisignature operation.
     * Internal version without access control.
     *
     * Requirements:
     *
     * * See {_validateReachableThreshold} for the threshold validation.
     */
    function _setThreshold(uint64 newThreshold) internal virtual {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        require(newThreshold > 0, MultiSignerTRC7913ZeroThreshold());
        $._threshold = newThreshold;
        _validateReachableThreshold();
        emit TRC7913ThresholdSet(newThreshold);
    }

    /**
     * @dev Validates the current threshold is reachable.
     *
     * Requirements:
     *
     * * The {getSignerCount} must be greater or equal than to the {threshold}. Throws
     * {MultiSignerTRC7913UnreachableThreshold} if not.
     */
    function _validateReachableThreshold() internal view virtual {
        MultiSignerTRC7913Storage storage $ = _getMultiSignerTRC7913Storage();
        uint256 signersLength = $._signers.length();
        uint64 currentThreshold = threshold();
        require(
            signersLength >= currentThreshold,
            MultiSignerTRC7913UnreachableThreshold(
                uint64(signersLength), // Safe cast. Economically impossible to overflow.
                currentThreshold
            )
        );
    }

    /**
     * @dev Decodes, validates the signature and checks the signers are authorized.
     * See {_validateSignatures} and {_validateThreshold} for more details.
     *
     * Example of signature encoding:
     *
     * ```solidity
     * // Encode signers (verifier || key)
     * bytes memory signer1 = abi.encodePacked(verifier1, key1);
     * bytes memory signer2 = abi.encodePacked(verifier2, key2);
     *
     * // Order signers by their id
     * if (keccak256(signer1) > keccak256(signer2)) {
     *     (signer1, signer2) = (signer2, signer1);
     *     (signature1, signature2) = (signature2, signature1);
     * }
     *
     * // Assign ordered signers and signatures
     * bytes[] memory signers = new bytes[](2);
     * bytes[] memory signatures = new bytes[](2);
     * signers[0] = signer1;
     * signatures[0] = signature1;
     * signers[1] = signer2;
     * signatures[1] = signature2;
     *
     * // Encode the multi signature
     * bytes memory signature = abi.encode(signers, signatures);
     * ```
     *
     * Requirements:
     *
     * * The `signature` must be encoded as `abi.encode(signers, signatures)`.
     */
    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override returns (bool) {
        if (signature.length == 0) return false; // For TRC-7739 compatibility
        (bytes[] memory signers, bytes[] memory signatures) = abi.decode(signature, (bytes[], bytes[]));
        return _validateThreshold(signers) && _validateSignatures(hash, signers, signatures);
    }

    /**
     * @dev Validates the signatures using the signers and their corresponding signatures.
     * Returns whether the signers are authorized and the signatures are valid for the given hash.
     *
     * IMPORTANT: Sorting the signers by their `keccak256` hash will improve the gas efficiency of this function.
     * See {SignatureChecker-areValidSignaturesNow-bytes32-bytes[]-bytes[]} for more details.
     *
     * Requirements:
     *
     * * The `signatures` and `signers` arrays must be equal in length. Returns false otherwise.
     */
    function _validateSignatures(
        bytes32 hash,
        bytes[] memory signers,
        bytes[] memory signatures
    ) internal view virtual returns (bool valid) {
        for (uint256 i = 0; i < signers.length; ++i) {
            if (!isSigner(signers[i])) {
                return false;
            }
        }
        return hash.areValidSignaturesNow(signers, signatures);
    }

    /**
     * @dev Validates that the number of signers meets the {threshold} requirement.
     * Assumes the signers were already validated. See {_validateSignatures} for more details.
     */
    function _validateThreshold(bytes[] memory validatingSigners) internal view virtual returns (bool) {
        return validatingSigners.length >= threshold();
    }
}
