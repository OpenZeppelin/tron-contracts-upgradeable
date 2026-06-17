// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../utils/cryptography/TRC7739MockUpgradeable.sol";
import "../docs/AccessManagerEnumerableUpgradeable.sol";
import "../token/TRC4626FeesMockUpgradeable.sol";
import "../VotesMockUpgradeable.sol";
import "../../crosschain/bridges/BridgeTRC20Upgradeable.sol";
import "../docs/TRC4626FeesUpgradeable.sol";
import "../token/TRC4626LimitsMockUpgradeable.sol";
import "../token/TRC4626MockUpgradeable.sol";
import "../token/TRC4626OffsetMockUpgradeable.sol";
import "../../metatx/TRC2771ForwarderUpgradeable.sol";
import "../../token/TRC20/extensions/TRC4626Upgradeable.sol";
import "../../token/TRC20/extensions/TRC20CrosschainUpgradeable.sol";
import "../../crosschain/bridges/BridgeTRC7802Upgradeable.sol";
import "../AccessManagerMockUpgradeable.sol";
import "../../access/manager/AccessManagerUpgradeable.sol";
import "../TIP712VerifierUpgradeable.sol";
import "../../utils/cryptography/signers/SignerP256Upgradeable.sol";
import "../../utils/cryptography/signers/SignerRSAUpgradeable.sol";
import "../../utils/MulticallUpgradeable.sol";
import "../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import "../../metatx/TRC2771ContextUpgradeable.sol";

contract TRC7739ECDSAMockUpgradeableWithInit is TRC7739ECDSAMockUpgradeable {
    constructor() payable initializer {
        __TRC7739ECDSAMock_init();
    }
}

contract TRC7739P256MockUpgradeableWithInit is TRC7739P256MockUpgradeable {
    constructor() payable initializer {
        __TRC7739P256Mock_init();
    }
}

contract TRC7739RSAMockUpgradeableWithInit is TRC7739RSAMockUpgradeable {
    constructor() payable initializer {
        __TRC7739RSAMock_init();
    }
}

contract AccessManagerEnumerableUpgradeableWithInit is AccessManagerEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessManagerEnumerable_init();
    }
}

contract TRC4626FeesMockUpgradeableWithInit is TRC4626FeesMockUpgradeable {
    constructor(
        uint256 entryFeeBasisPoints,
        address entryFeeRecipient,
        uint256 exitFeeBasisPoints,
        address exitFeeRecipient
    ) payable initializer {
        __TRC4626FeesMock_init(entryFeeBasisPoints, entryFeeRecipient, exitFeeBasisPoints, exitFeeRecipient);
    }
}

contract VotesMockUpgradeableWithInit is VotesMockUpgradeable {
    constructor() payable initializer {
        __VotesMock_init();
    }
}

contract VotesTimestampMockUpgradeableWithInit is VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __VotesTimestampMock_init();
    }
}

contract BridgeTRC20UpgradeableWithInit is BridgeTRC20Upgradeable {
    constructor(ITRC20 token_) payable initializer {
        __BridgeTRC20_init(token_);
    }
}

contract TRC4626FeesUpgradeableWithInit is TRC4626FeesUpgradeable {
    constructor() payable initializer {
        __TRC4626Fees_init();
    }
}

contract TRC4626LimitsMockUpgradeableWithInit is TRC4626LimitsMockUpgradeable {
    constructor() payable initializer {
        __TRC4626LimitsMock_init();
    }
}

contract TRC4626MockUpgradeableWithInit is TRC4626MockUpgradeable {
    constructor(address underlying) payable initializer {
        __TRC4626Mock_init(underlying);
    }
}

contract TRC4626OffsetMockUpgradeableWithInit is TRC4626OffsetMockUpgradeable {
    constructor(uint8 offset_) payable initializer {
        __TRC4626OffsetMock_init(offset_);
    }
}

contract TRC2771ForwarderUpgradeableWithInit is TRC2771ForwarderUpgradeable {
    constructor(string memory name) payable initializer {
        __TRC2771Forwarder_init(name);
    }
}

contract TRC4626UpgradeableWithInit is TRC4626Upgradeable {
    constructor(ITRC20 asset_) payable initializer {
        __TRC4626_init(asset_);
    }
}

contract TRC20CrosschainUpgradeableWithInit is TRC20CrosschainUpgradeable {
    constructor() payable initializer {
        __TRC20Crosschain_init();
    }
}

contract BridgeTRC7802UpgradeableWithInit is BridgeTRC7802Upgradeable {
    constructor(ITRC7802 token_) payable initializer {
        __BridgeTRC7802_init(token_);
    }
}

contract AccessManagerMockUpgradeableWithInit is AccessManagerMockUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManagerMock_init(initialAdmin);
    }
}

contract AccessManagerUpgradeableWithInit is AccessManagerUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManager_init(initialAdmin);
    }
}

contract TIP712VerifierUpgradeableWithInit is TIP712VerifierUpgradeable {
    constructor() payable initializer {
        __TIP712Verifier_init();
    }
}

contract SignerP256UpgradeableWithInit is SignerP256Upgradeable {
    constructor(bytes32 qx, bytes32 qy) payable initializer {
        __SignerP256_init(qx, qy);
    }
}

contract SignerRSAUpgradeableWithInit is SignerRSAUpgradeable {
    constructor(bytes memory e, bytes memory n) payable initializer {
        __SignerRSA_init(e, n);
    }
}

contract MulticallUpgradeableWithInit is MulticallUpgradeable {
    constructor() payable initializer {
        __Multicall_init();
    }
}

contract SignerECDSAUpgradeableWithInit is SignerECDSAUpgradeable {
    constructor(address signerAddr) payable initializer {
        __SignerECDSA_init(signerAddr);
    }
}

contract TRC2771ContextUpgradeableWithInit is TRC2771ContextUpgradeable {
    constructor(address trustedForwarder_) TRC2771ContextUpgradeable(trustedForwarder_) payable initializer {

    }
}
