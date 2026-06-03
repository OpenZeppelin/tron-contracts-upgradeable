// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.6.0) (utils/cryptography/signers/SignerEIP7702.sol)

pragma solidity ^0.8.20;

import {AbstractSignerUpgradeable} from "./AbstractSignerUpgradeable.sol";
import {ECDSAUpgradeable} from "../ECDSAUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev Implementation of {AbstractSigner} for implementation for an EOA. Useful for EIP-7702 accounts.
 *
 * @custom:stateless
 */
abstract contract SignerEIP7702Upgradeable is Initializable, AbstractSignerUpgradeable {
    function __SignerEIP7702_init() internal onlyInitializing {
    }

    function __SignerEIP7702_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev Validates the signature using the EOA's address (i.e. `address(this)`).
     */
    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override returns (bool) {
        (address recovered, ECDSAUpgradeable.RecoverError err, ) = ECDSAUpgradeable.tryRecoverCalldata(hash, signature);
        return address(this) == recovered && err == ECDSAUpgradeable.RecoverError.NoError;
    }
}
