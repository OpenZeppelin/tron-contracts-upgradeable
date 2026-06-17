// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (utils/cryptography/signers/SignerTRC7913.sol)

pragma solidity ^0.8.24;

import {AbstractSigner} from "@openzeppelin/tron-contracts/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {SignatureChecker} from "@openzeppelin/tron-contracts/contracts/utils/cryptography/SignatureChecker.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of {AbstractSigner} using
 * https://eips.ethereum.org/EIPS/eip-7913[ERC-7913] signature verification.
 *
 * For {Account} usage, a {_setSigner} function is provided to set the ERC-7913 formatted {signer}.
 * Doing so is easier for a factory, who is likely to use initializable clones of this contract.
 *
 * The signer is a `bytes` object that concatenates a verifier address and a key: `verifier || key`.
 *
 * Example of usage:
 *
 * ```solidity
 * contract MyAccountTRC7913 is Account, SignerTRC7913, Initializable {
 *     function initialize(bytes memory signer_) public initializer {
 *       _setSigner(signer_);
 *     }
 *
 *     function setSigner(bytes memory signer_) public onlyEntryPointOrSelf {
 *       _setSigner(signer_);
 *     }
 * }
 * ```
 *
 * IMPORTANT: Failing to call {_setSigner} either during construction (if used standalone)
 * or during initialization (if used as a clone) may leave the signer either front-runnable or unusable.
 */

abstract contract SignerTRC7913Upgradeable is Initializable, AbstractSigner {
    /// @custom:storage-location erc7201:openzeppelin.storage.SignerTRC7913
    struct SignerTRC7913Storage {
        bytes _signer;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.SignerTRC7913")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SignerTRC7913StorageLocation = 0xdbf0303ceb9dab0bab03f483541ce93dd84600a015ebafeffe0e3304de438c00;

    function _getSignerTRC7913Storage() private pure returns (SignerTRC7913Storage storage $) {
        assembly {
            $.slot := SignerTRC7913StorageLocation
        }
    }

    function __SignerTRC7913_init(bytes memory signer_) internal onlyInitializing {
        __SignerTRC7913_init_unchained(signer_);
    }

    function __SignerTRC7913_init_unchained(bytes memory signer_) internal onlyInitializing {
        _setSigner(signer_);
    }

    /// @dev Return the ERC-7913 signer (i.e. `verifier || key`).
    function signer() public view virtual returns (bytes memory) {
        SignerTRC7913Storage storage $ = _getSignerTRC7913Storage();
        return $._signer;
    }

    /// @dev Sets the signer (i.e. `verifier || key`) with an ERC-7913 formatted signer.
    function _setSigner(bytes memory signer_) internal {
        SignerTRC7913Storage storage $ = _getSignerTRC7913Storage();
        $._signer = signer_;
    }

    /**
     * @dev Verifies a signature using {SignatureChecker-isValidSignatureNow-bytes-bytes32-bytes-}
     * with {signer}, `hash` and `signature`.
     */
    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override returns (bool) {
        return SignatureChecker.isValidSignatureNow(signer(), hash, signature);
    }
}
