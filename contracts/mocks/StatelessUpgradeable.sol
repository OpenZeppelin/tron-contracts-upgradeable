// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// We keep these imports and a dummy contract just to we can run the test suite after transpilation.

import {AccumulatorsUpgradeable} from "../utils/structs/AccumulatorsUpgradeable.sol";
import {AddressUpgradeable} from "../utils/AddressUpgradeable.sol";
import {ArraysUpgradeable} from "../utils/ArraysUpgradeable.sol";
import {AuthorityUtilsUpgradeable} from "../access/manager/AuthorityUtilsUpgradeable.sol";
import {Base58Upgradeable} from "../utils/Base58Upgradeable.sol";
import {Base64Upgradeable} from "../utils/Base64Upgradeable.sol";
import {BitMapsUpgradeable} from "../utils/structs/BitMapsUpgradeable.sol";
import {BlockhashUpgradeable} from "../utils/BlockhashUpgradeable.sol";
import {BytesUpgradeable} from "../utils/BytesUpgradeable.sol";
import {CAIP2Upgradeable} from "../utils/CAIP2Upgradeable.sol";
import {CAIP10Upgradeable} from "../utils/CAIP10Upgradeable.sol";
import {CheckpointsUpgradeable} from "../utils/structs/CheckpointsUpgradeable.sol";
import {CircularBufferUpgradeable} from "../utils/structs/CircularBufferUpgradeable.sol";
import {ClonesUpgradeable} from "../proxy/ClonesUpgradeable.sol";
import {Create2Upgradeable} from "../utils/Create2Upgradeable.sol";
import {DoubleEndedQueueUpgradeable} from "../utils/structs/DoubleEndedQueueUpgradeable.sol";
import {ECDSAUpgradeable} from "../utils/cryptography/ECDSAUpgradeable.sol";
import {EnumerableMapUpgradeable} from "../utils/structs/EnumerableMapUpgradeable.sol";
import {EnumerableSetUpgradeable} from "../utils/structs/EnumerableSetUpgradeable.sol";
import {ERC165Upgradeable} from "../utils/introspection/ERC165Upgradeable.sol";
import {ERC165CheckerUpgradeable} from "../utils/introspection/ERC165CheckerUpgradeable.sol";
import {TRC1155HolderUpgradeable} from "../token/TRC1155/utils/TRC1155HolderUpgradeable.sol";
import {TRC721HolderUpgradeable} from "../token/TRC721/utils/TRC721HolderUpgradeable.sol";
import {ERC1967UtilsUpgradeable} from "../proxy/ERC1967/ERC1967UtilsUpgradeable.sol";
import {ERC7913P256VerifierUpgradeable} from "../utils/cryptography/verifiers/ERC7913P256VerifierUpgradeable.sol";
import {ERC7913RSAVerifierUpgradeable} from "../utils/cryptography/verifiers/ERC7913RSAVerifierUpgradeable.sol";
import {ERC7913WebAuthnVerifierUpgradeable} from "../utils/cryptography/verifiers/ERC7913WebAuthnVerifierUpgradeable.sol";
import {HeapUpgradeable} from "../utils/structs/HeapUpgradeable.sol";
import {InteroperableAddressUpgradeable} from "../utils/draft-InteroperableAddressUpgradeable.sol";
import {LowLevelCallUpgradeable} from "../utils/LowLevelCallUpgradeable.sol";
import {MathUpgradeable} from "../utils/math/MathUpgradeable.sol";
import {MemoryUpgradeable} from "../utils/MemoryUpgradeable.sol";
import {MerkleProofUpgradeable} from "../utils/cryptography/MerkleProofUpgradeable.sol";
import {MessageHashUtilsUpgradeable} from "../utils/cryptography/MessageHashUtilsUpgradeable.sol";
import {NoncesUpgradeable} from "../utils/NoncesUpgradeable.sol";
import {NoncesKeyedUpgradeable} from "../utils/NoncesKeyedUpgradeable.sol";
import {P256Upgradeable} from "../utils/cryptography/P256Upgradeable.sol";
import {PackingUpgradeable} from "../utils/PackingUpgradeable.sol";
import {PanicUpgradeable} from "../utils/PanicUpgradeable.sol";
import {RelayedCallUpgradeable} from "../utils/RelayedCallUpgradeable.sol";
import {RLPUpgradeable} from "../utils/RLPUpgradeable.sol";
import {RSAUpgradeable} from "../utils/cryptography/RSAUpgradeable.sol";
import {SafeCastUpgradeable} from "../utils/math/SafeCastUpgradeable.sol";
import {SafeTRC20Upgradeable} from "../token/TRC20/utils/SafeTRC20Upgradeable.sol";
import {ShortStringsUpgradeable} from "../utils/ShortStringsUpgradeable.sol";
import {SignatureCheckerUpgradeable} from "../utils/cryptography/SignatureCheckerUpgradeable.sol";
import {SignedMathUpgradeable} from "../utils/math/SignedMathUpgradeable.sol";
import {StorageSlotUpgradeable} from "../utils/StorageSlotUpgradeable.sol";
import {StringsUpgradeable} from "../utils/StringsUpgradeable.sol";
import {TimeUpgradeable} from "../utils/types/TimeUpgradeable.sol";
import {TrieProofUpgradeable} from "../utils/cryptography/TrieProofUpgradeable.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

contract Dummy1234Upgradeable is Initializable {    function __Dummy1234_init() internal onlyInitializing {
    }

    function __Dummy1234_init_unchained() internal onlyInitializing {
    }
}
