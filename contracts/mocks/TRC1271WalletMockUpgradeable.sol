// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {OwnableUpgradeable} from "../access/OwnableUpgradeable.sol";
import {ITRC1271} from "@openzeppelin/tron-contracts/contracts/interfaces/ITRC1271.sol";
import {ECDSA} from "@openzeppelin/tron-contracts/contracts/utils/cryptography/ECDSA.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

contract TRC1271WalletMockUpgradeable is Initializable, OwnableUpgradeable, ITRC1271 {
    function __TRC1271WalletMock_init(address originalOwner) internal onlyInitializing {
        __Ownable_init_unchained(originalOwner);
    }

    function __TRC1271WalletMock_init_unchained(address) internal onlyInitializing {}

    function isValidSignature(bytes32 hash, bytes memory signature) public view returns (bytes4 magicValue) {
        return ECDSA.recover(hash, signature) == owner() ? this.isValidSignature.selector : bytes4(0);
    }
}

contract TRC1271MaliciousMockUpgradeable is Initializable, ITRC1271 {
    function __TRC1271MaliciousMock_init() internal onlyInitializing {
    }

    function __TRC1271MaliciousMock_init_unchained() internal onlyInitializing {
    }
    function isValidSignature(bytes32, bytes memory) public pure returns (bytes4) {
        assembly {
            mstore(0, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            return(0, 32)
        }
    }
}
