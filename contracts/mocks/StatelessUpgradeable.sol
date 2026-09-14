// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// We keep these imports and a dummy contract just to we can run the test suite after transpilation.

import {Accumulators} from "@openzeppelin/tron-contracts/utils/structs/Accumulators.sol";
import {Address} from "@openzeppelin/tron-contracts/utils/Address.sol";
import {Arrays} from "@openzeppelin/tron-contracts/utils/Arrays.sol";
import {AuthorityUtils} from "@openzeppelin/tron-contracts/access/manager/AuthorityUtils.sol";
import {Base58} from "@openzeppelin/tron-contracts/utils/Base58.sol";
import {Base64} from "@openzeppelin/tron-contracts/utils/Base64.sol";
import {BitMaps} from "@openzeppelin/tron-contracts/utils/structs/BitMaps.sol";
import {Blockhash} from "@openzeppelin/tron-contracts/utils/Blockhash.sol";
import {Bytes} from "@openzeppelin/tron-contracts/utils/Bytes.sol";
import {CAIP2} from "@openzeppelin/tron-contracts/utils/CAIP2.sol";
import {CAIP10} from "@openzeppelin/tron-contracts/utils/CAIP10.sol";
import {Checkpoints} from "@openzeppelin/tron-contracts/utils/structs/Checkpoints.sol";
import {CircularBuffer} from "@openzeppelin/tron-contracts/utils/structs/CircularBuffer.sol";
import {Clones} from "@openzeppelin/tron-contracts/proxy/Clones.sol";
import {Create2} from "@openzeppelin/tron-contracts/utils/Create2.sol";
import {DoubleEndedQueue} from "@openzeppelin/tron-contracts/utils/structs/DoubleEndedQueue.sol";
import {ECDSA} from "@openzeppelin/tron-contracts/utils/cryptography/ECDSA.sol";
import {EnumerableMap} from "@openzeppelin/tron-contracts/utils/structs/EnumerableMap.sol";
import {EnumerableSet} from "@openzeppelin/tron-contracts/utils/structs/EnumerableSet.sol";
import {TRC165Upgradeable} from "../utils/introspection/TRC165Upgradeable.sol";
import {TRC165Checker} from "@openzeppelin/tron-contracts/utils/introspection/TRC165Checker.sol";
import {TRC1155Holder} from "@openzeppelin/tron-contracts/token/TRC1155/utils/TRC1155Holder.sol";
import {TRC721Holder} from "@openzeppelin/tron-contracts/token/TRC721/utils/TRC721Holder.sol";
import {TRC1967Utils} from "@openzeppelin/tron-contracts/proxy/TRC1967/TRC1967Utils.sol";
import {TRC7913P256Verifier} from "@openzeppelin/tron-contracts/utils/cryptography/verifiers/TRC7913P256Verifier.sol";
import {TRC7913RSAVerifier} from "@openzeppelin/tron-contracts/utils/cryptography/verifiers/TRC7913RSAVerifier.sol";
import {
    TRC7913WebAuthnVerifier
} from "@openzeppelin/tron-contracts/utils/cryptography/verifiers/TRC7913WebAuthnVerifier.sol";
import {Heap} from "@openzeppelin/tron-contracts/utils/structs/Heap.sol";
import {InteroperableAddress} from "@openzeppelin/tron-contracts/utils/draft-InteroperableAddress.sol";
import {LowLevelCall} from "@openzeppelin/tron-contracts/utils/LowLevelCall.sol";
import {Math} from "@openzeppelin/tron-contracts/utils/math/Math.sol";
import {Memory} from "@openzeppelin/tron-contracts/utils/Memory.sol";
import {MerkleProof} from "@openzeppelin/tron-contracts/utils/cryptography/MerkleProof.sol";
import {MessageHashUtils} from "@openzeppelin/tron-contracts/utils/cryptography/MessageHashUtils.sol";
import {NoncesUpgradeable} from "../utils/NoncesUpgradeable.sol";
import {NoncesKeyedUpgradeable} from "../utils/NoncesKeyedUpgradeable.sol";
import {P256} from "@openzeppelin/tron-contracts/utils/cryptography/P256.sol";
import {Packing} from "@openzeppelin/tron-contracts/utils/Packing.sol";
import {Panic} from "@openzeppelin/tron-contracts/utils/Panic.sol";
import {RelayedCall} from "@openzeppelin/tron-contracts/utils/RelayedCall.sol";
import {RLP} from "@openzeppelin/tron-contracts/utils/RLP.sol";
import {RSA} from "@openzeppelin/tron-contracts/utils/cryptography/RSA.sol";
import {SafeCast} from "@openzeppelin/tron-contracts/utils/math/SafeCast.sol";
import {SafeTRC20} from "@openzeppelin/tron-contracts/token/TRC20/utils/SafeTRC20.sol";
import {ShortStrings} from "@openzeppelin/tron-contracts/utils/ShortStrings.sol";
import {SignatureChecker} from "@openzeppelin/tron-contracts/utils/cryptography/SignatureChecker.sol";
import {SignedMath} from "@openzeppelin/tron-contracts/utils/math/SignedMath.sol";
import {StorageSlot} from "@openzeppelin/tron-contracts/utils/StorageSlot.sol";
import {Strings} from "@openzeppelin/tron-contracts/utils/Strings.sol";
import {Time} from "@openzeppelin/tron-contracts/utils/types/Time.sol";
import {TrieProof} from "@openzeppelin/tron-contracts/utils/cryptography/TrieProof.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

contract Dummy1234Upgradeable is Initializable {
    function __Dummy1234_init() internal onlyInitializing {}

    function __Dummy1234_init_unchained() internal onlyInitializing {}
}
