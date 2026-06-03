// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {MerkleProofUpgradeable} from "../utils/cryptography/MerkleProofUpgradeable.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

// This could be a library, but then we would have to add it to the Stateless.sol mock for upgradeable tests
abstract contract MerkleProofCustomHashMockUpgradeable is Initializable {
    function __MerkleProofCustomHashMock_init() internal onlyInitializing {
    }

    function __MerkleProofCustomHashMock_init_unchained() internal onlyInitializing {
    }
    function customHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return a < b ? sha256(abi.encode(a, b)) : sha256(abi.encode(b, a));
    }

    function verify(bytes32[] calldata proof, bytes32 root, bytes32 leaf) internal view returns (bool) {
        return MerkleProofUpgradeable.verify(proof, root, leaf, customHash);
    }

    function processProof(bytes32[] calldata proof, bytes32 leaf) internal view returns (bytes32) {
        return MerkleProofUpgradeable.processProof(proof, leaf, customHash);
    }

    function verifyCalldata(bytes32[] calldata proof, bytes32 root, bytes32 leaf) internal view returns (bool) {
        return MerkleProofUpgradeable.verifyCalldata(proof, root, leaf, customHash);
    }

    function processProofCalldata(bytes32[] calldata proof, bytes32 leaf) internal view returns (bytes32) {
        return MerkleProofUpgradeable.processProofCalldata(proof, leaf, customHash);
    }

    function multiProofVerify(
        bytes32[] calldata proof,
        bool[] calldata proofFlags,
        bytes32 root,
        bytes32[] calldata leaves
    ) internal view returns (bool) {
        return MerkleProofUpgradeable.multiProofVerify(proof, proofFlags, root, leaves, customHash);
    }

    function processMultiProof(
        bytes32[] calldata proof,
        bool[] calldata proofFlags,
        bytes32[] calldata leaves
    ) internal view returns (bytes32) {
        return MerkleProofUpgradeable.processMultiProof(proof, proofFlags, leaves, customHash);
    }

    function multiProofVerifyCalldata(
        bytes32[] calldata proof,
        bool[] calldata proofFlags,
        bytes32 root,
        bytes32[] calldata leaves
    ) internal view returns (bool) {
        return MerkleProofUpgradeable.multiProofVerifyCalldata(proof, proofFlags, root, leaves, customHash);
    }

    function processMultiProofCalldata(
        bytes32[] calldata proof,
        bool[] calldata proofFlags,
        bytes32[] calldata leaves
    ) internal view returns (bytes32) {
        return MerkleProofUpgradeable.processMultiProofCalldata(proof, proofFlags, leaves, customHash);
    }
}
