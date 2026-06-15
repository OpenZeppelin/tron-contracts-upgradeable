// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../StatelessUpgradeable.sol";
import "../../utils/cryptography/signers/MultiSignerERC7913WeightedUpgradeable.sol";
import "../../utils/cryptography/signers/MultiSignerERC7913Upgradeable.sol";
import "../../utils/introspection/ERC165Upgradeable.sol";
import "../../utils/NoncesKeyedUpgradeable.sol";
import "../../utils/NoncesUpgradeable.sol";

contract Dummy1234UpgradeableWithInit is Dummy1234Upgradeable {
    constructor() payable initializer {
        __Dummy1234_init();
    }
}

contract MultiSignerERC7913WeightedUpgradeableWithInit is MultiSignerERC7913WeightedUpgradeable {
    constructor(bytes[] memory signers_, uint64[] memory weights_, uint64 threshold_) payable initializer {
        __MultiSignerERC7913Weighted_init(signers_, weights_, threshold_);
    }
}

contract MultiSignerERC7913UpgradeableWithInit is MultiSignerERC7913Upgradeable {
    constructor(bytes[] memory signers_, uint64 threshold_) payable initializer {
        __MultiSignerERC7913_init(signers_, threshold_);
    }
}

contract ERC165UpgradeableWithInit is ERC165Upgradeable {
    constructor() payable initializer {
        __ERC165_init();
    }
}

contract NoncesKeyedUpgradeableWithInit is NoncesKeyedUpgradeable {
    constructor() payable initializer {
        __NoncesKeyed_init();
    }
}

contract NoncesUpgradeableWithInit is NoncesUpgradeable {
    constructor() payable initializer {
        __Nonces_init();
    }
}
