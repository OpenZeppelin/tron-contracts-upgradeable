// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../docs/access-control/AccessManagedTRC20MintBaseUpgradeable.sol";
import "../MulticallHelperUpgradeable.sol";
import "../token/TRC20BridgeableMockUpgradeable.sol";
import "../docs/access-control/AccessControlTRC20MintBaseUpgradeable.sol";
import "../docs/access-control/AccessControlTRC20MintMissingUpgradeable.sol";
import "../docs/access-control/AccessControlTRC20MintOnlyRoleUpgradeable.sol";
import "../MerkleTreeMockUpgradeable.sol";
import "../proxy/UUPSUpgradeableMockUpgradeable.sol";
import "../token/TRC20MulticallMockUpgradeable.sol";
import "../../utils/cryptography/signers/SignerERC7913Upgradeable.sol";
import "../token/TRC20FlashMintMockUpgradeable.sol";
import "../token/TRC20ReentrantUpgradeable.sol";
import "../AccessManagedTargetUpgradeable.sol";
import "../ArraysMockUpgradeable.sol";
import "../crosschain/ERC7786GatewayMockUpgradeable.sol";
import "../DummyImplementationUpgradeable.sol";
import "../ERC2771ContextMockUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20FlashMintUpgradeable.sol";
import "../docs/token/ERC6909/ERC6909GameItemsUpgradeable.sol";
import "../StorageSlotMockUpgradeable.sol";
import "../TransientSlotMockUpgradeable.sol";
import "../../access/manager/AccessManagedUpgradeable.sol";
import "../docs/access-control/AccessControlModifiedUpgradeable.sol";
import "../../token/ERC6909/extensions/ERC6909MetadataUpgradeable.sol";
import "../../token/ERC6909/ERC6909Upgradeable.sol";
import "../ContextMockUpgradeable.sol";

contract AccessManagedTRC20MintUpgradeableWithInit is AccessManagedTRC20MintUpgradeable {
    constructor(address manager) payable initializer {
        __AccessManagedTRC20Mint_init(manager);
    }
}

contract MulticallHelperUpgradeableWithInit is MulticallHelperUpgradeable {
    constructor() payable initializer {
        __MulticallHelper_init();
    }
}

contract TRC20BridgeableMockUpgradeableWithInit is TRC20BridgeableMockUpgradeable {
    constructor(address initialBridge) payable initializer {
        __TRC20BridgeableMock_init(initialBridge);
    }
}

contract AccessControlTRC20MintBaseUpgradeableWithInit is AccessControlTRC20MintBaseUpgradeable {
    constructor(address minter) payable initializer {
        __AccessControlTRC20MintBase_init(minter);
    }
}

contract AccessControlTRC20MintMissingUpgradeableWithInit is AccessControlTRC20MintMissingUpgradeable {
    constructor() payable initializer {
        __AccessControlTRC20MintMissing_init();
    }
}

contract AccessControlTRC20MintUpgradeableWithInit is AccessControlTRC20MintUpgradeable {
    constructor(address minter, address burner) payable initializer {
        __AccessControlTRC20Mint_init(minter, burner);
    }
}

contract MerkleTreeMockUpgradeableWithInit is MerkleTreeMockUpgradeable {
    constructor() payable initializer {
        __MerkleTreeMock_init();
    }
}

contract NonUpgradeableMockUpgradeableWithInit is NonUpgradeableMockUpgradeable {
    constructor() payable initializer {
        __NonUpgradeableMock_init();
    }
}

contract UUPSUpgradeableMockUpgradeableWithInit is UUPSUpgradeableMockUpgradeable {
    constructor() payable initializer {
        __UUPSUpgradeableMock_init();
    }
}

contract UUPSUpgradeableUnsafeMockUpgradeableWithInit is UUPSUpgradeableUnsafeMockUpgradeable {
    constructor() payable initializer {
        __UUPSUpgradeableUnsafeMock_init();
    }
}

contract UUPSUnsupportedProxiableUUIDMockUpgradeableWithInit is UUPSUnsupportedProxiableUUIDMockUpgradeable {
    constructor() payable initializer {
        __UUPSUnsupportedProxiableUUIDMock_init();
    }
}

contract TRC20MulticallMockUpgradeableWithInit is TRC20MulticallMockUpgradeable {
    constructor() payable initializer {
        __TRC20MulticallMock_init();
    }
}

contract SignerERC7913UpgradeableWithInit is SignerERC7913Upgradeable {
    constructor(bytes memory signer_) payable initializer {
        __SignerERC7913_init(signer_);
    }
}

contract TRC20FlashMintMockUpgradeableWithInit is TRC20FlashMintMockUpgradeable {
    constructor() payable initializer {
        __TRC20FlashMintMock_init();
    }
}

contract TRC20ReentrantUpgradeableWithInit is TRC20ReentrantUpgradeable {
    constructor() payable initializer {
        __TRC20Reentrant_init();
    }
}

contract AccessManagedTargetUpgradeableWithInit is AccessManagedTargetUpgradeable {
    constructor() payable initializer {
        __AccessManagedTarget_init();
    }
}

contract Uint256ArraysMockUpgradeableWithInit is Uint256ArraysMockUpgradeable {
    constructor(uint256[] memory array) payable initializer {
        __Uint256ArraysMock_init(array);
    }
}

contract AddressArraysMockUpgradeableWithInit is AddressArraysMockUpgradeable {
    constructor(address[] memory array) payable initializer {
        __AddressArraysMock_init(array);
    }
}

contract Bytes32ArraysMockUpgradeableWithInit is Bytes32ArraysMockUpgradeable {
    constructor(bytes32[] memory array) payable initializer {
        __Bytes32ArraysMock_init(array);
    }
}

contract BytesArraysMockUpgradeableWithInit is BytesArraysMockUpgradeable {
    constructor(bytes[] memory array) payable initializer {
        __BytesArraysMock_init(array);
    }
}

contract StringArraysMockUpgradeableWithInit is StringArraysMockUpgradeable {
    constructor(string[] memory array) payable initializer {
        __StringArraysMock_init(array);
    }
}

contract ERC7786GatewayMockUpgradeableWithInit is ERC7786GatewayMockUpgradeable {
    constructor() payable initializer {
        __ERC7786GatewayMock_init();
    }
}

contract DummyImplementationUpgradeableWithInit is DummyImplementationUpgradeable {
    constructor() payable initializer {
        __DummyImplementation_init();
    }
}

contract DummyImplementationV2UpgradeableWithInit is DummyImplementationV2Upgradeable {
    constructor() payable initializer {
        __DummyImplementationV2_init();
    }
}

contract ERC2771ContextMockUpgradeableWithInit is ERC2771ContextMockUpgradeable {
    constructor(address trustedForwarder) ERC2771ContextMockUpgradeable(trustedForwarder) payable initializer {

    }
}

contract TRC20FlashMintUpgradeableWithInit is TRC20FlashMintUpgradeable {
    constructor() payable initializer {
        __TRC20FlashMint_init();
    }
}

contract ERC6909GameItemsUpgradeableWithInit is ERC6909GameItemsUpgradeable {
    constructor() payable initializer {
        __ERC6909GameItems_init();
    }
}

contract StorageSlotMockUpgradeableWithInit is StorageSlotMockUpgradeable {
    constructor() payable initializer {
        __StorageSlotMock_init();
    }
}

contract TransientSlotMockUpgradeableWithInit is TransientSlotMockUpgradeable {
    constructor() payable initializer {
        __TransientSlotMock_init();
    }
}

contract AccessManagedUpgradeableWithInit is AccessManagedUpgradeable {
    constructor(address initialAuthority) payable initializer {
        __AccessManaged_init(initialAuthority);
    }
}

contract AccessControlModifiedUpgradeableWithInit is AccessControlModifiedUpgradeable {
    constructor() payable initializer {
        __AccessControlModified_init();
    }
}

contract ERC6909MetadataUpgradeableWithInit is ERC6909MetadataUpgradeable {
    constructor() payable initializer {
        __ERC6909Metadata_init();
    }
}

contract ERC6909UpgradeableWithInit is ERC6909Upgradeable {
    constructor() payable initializer {
        __ERC6909_init();
    }
}

contract ContextMockUpgradeableWithInit is ContextMockUpgradeable {
    constructor() payable initializer {
        __ContextMock_init();
    }
}

contract ContextMockCallerUpgradeableWithInit is ContextMockCallerUpgradeable {
    constructor() payable initializer {
        __ContextMockCaller_init();
    }
}
