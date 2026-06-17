// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {ECDSA} from "@openzeppelin/tron-contracts/contracts/utils/cryptography/ECDSA.sol";
import {TIP712Upgradeable} from "../utils/cryptography/TIP712Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

abstract contract TIP712VerifierUpgradeable is Initializable, TIP712Upgradeable {
    function __TIP712Verifier_init() internal onlyInitializing {
    }

    function __TIP712Verifier_init_unchained() internal onlyInitializing {
    }
    function verify(bytes memory signature, address signer, address mailTo, string memory mailContents) external view {
        bytes32 digest = _hashTypedDataV4(
            keccak256(abi.encode(keccak256("Mail(address to,string contents)"), mailTo, keccak256(bytes(mailContents))))
        );
        address recoveredSigner = ECDSA.recover(digest, signature);
        require(recoveredSigner == signer);
    }
}
