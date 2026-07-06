// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../docs/token/TRC721/GameItemUpgradeable.sol";
import "../MulticallHelperUpgradeable.sol";
import "../token/TRC1363ForceApproveMockUpgradeable.sol";
import "../token/TRC1363NoReturnMockUpgradeable.sol";
import "../token/TRC1363ReturnFalseMockUpgradeable.sol";
import "../token/TRC20BridgeableMockUpgradeable.sol";
import "../token/TRC4626FeesMockUpgradeable.sol";
import "../token/TRC721URIStorageMockUpgradeable.sol";
import "../TRC2771ContextMockUpgradeable.sol";
import "../../token/TRC1155/extensions/TRC1155PausableUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20CrosschainUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721RoyaltyUpgradeable.sol";
import "../../access/extensions/AccessControlDefaultAdminRulesUpgradeable.sol";
import "../../access/extensions/AccessControlEnumerableUpgradeable.sol";
import "../../crosschain/bridges/BridgeTRC20Upgradeable.sol";
import "../../crosschain/bridges/BridgeTRC7802Upgradeable.sol";
import "../../finance/VestingWalletCliffUpgradeable.sol";
import "../AccessManagerMockUpgradeable.sol";
import "../docs/access-control/AccessControlModifiedUpgradeable.sol";
import "../docs/access-control/AccessManagedTRC20MintBaseUpgradeable.sol";
import "../docs/AccessManagerEnumerableUpgradeable.sol";
import "../docs/MyNFTUpgradeable.sol";
import "../docs/token/TRC1155/GameItemsUpgradeable.sol";
import "../docs/TRC4626FeesUpgradeable.sol";
import "../docs/utilities/Base64NFTUpgradeable.sol";
import "../StatelessUpgradeable.sol";
import "../token/TRC20FlashMintMockUpgradeable.sol";
import "../token/TRC20MulticallMockUpgradeable.sol";
import "../token/TRC4626LimitsMockUpgradeable.sol";
import "../token/TRC4626MockUpgradeable.sol";
import "../token/TRC4626OffsetMockUpgradeable.sol";
import "../../token/TRC1155/extensions/TRC1155BurnableUpgradeable.sol";
import "../../token/TRC1155/extensions/TRC1155SupplyUpgradeable.sol";
import "../../token/TRC1155/extensions/TRC1155URIStorageUpgradeable.sol";
import "../../token/TRC20/extensions/TRC1363Upgradeable.sol";
import "../../token/TRC20/extensions/TRC20PausableUpgradeable.sol";
import "../../token/TRC6909/extensions/TRC6909ContentURIUpgradeable.sol";
import "../../token/TRC6909/extensions/TRC6909TokenSupplyUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721BurnableUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721URIStorageUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721WrapperUpgradeable.sol";
import "../../access/manager/AccessManagerUpgradeable.sol";
import "../../access/Ownable2StepUpgradeable.sol";
import "../../finance/VestingWalletUpgradeable.sol";
import "../AccessManagedTargetUpgradeable.sol";
import "../docs/access-control/MyContractOwnableUpgradeable.sol";
import "../docs/token/TRC20/GLDTokenUpgradeable.sol";
import "../docs/TRC20WithAutoMinerRewardUpgradeable.sol";
import "../docs/utilities/MulticallUpgradeable.sol";
import "../PausableMockUpgradeable.sol";
import "../ReentrancyMockUpgradeable.sol";
import "../ReentrancyTransientMockUpgradeable.sol";
import "../StorageSlotMockUpgradeable.sol";
import "../../token/TRC1155/TRC1155Upgradeable.sol";
import "../../token/TRC20/extensions/TRC20FlashMintUpgradeable.sol";
import "../../token/TRC20/extensions/TRC4626Upgradeable.sol";
import "../../access/manager/AccessManagedUpgradeable.sol";
import "../../access/OwnableUpgradeable.sol";
import "../ContextMockUpgradeable.sol";
import "../ReentrancyAttackUpgradeable.sol";
import "../../token/common/TRC2981Upgradeable.sol";
import "../../utils/MulticallUpgradeable.sol";

contract GameItemUpgradeableWithInit is GameItemUpgradeable {
    constructor() payable initializer {
        __GameItem_init();
    }
}

contract MulticallHelperUpgradeableWithInit is MulticallHelperUpgradeable {
    constructor() payable initializer {
        __MulticallHelper_init();
    }
}

contract TRC1363ForceApproveMockUpgradeableWithInit is TRC1363ForceApproveMockUpgradeable {
    constructor() payable initializer {
        __TRC1363ForceApproveMock_init();
    }
}

contract TRC1363NoReturnMockUpgradeableWithInit is TRC1363NoReturnMockUpgradeable {
    constructor() payable initializer {
        __TRC1363NoReturnMock_init();
    }
}

contract TRC1363ReturnFalseOnTRC20MockUpgradeableWithInit is TRC1363ReturnFalseOnTRC20MockUpgradeable {
    constructor() payable initializer {
        __TRC1363ReturnFalseOnTRC20Mock_init();
    }
}

contract TRC1363ReturnFalseMockUpgradeableWithInit is TRC1363ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __TRC1363ReturnFalseMock_init();
    }
}

contract TRC20BridgeableMockUpgradeableWithInit is TRC20BridgeableMockUpgradeable {
    constructor(address initialBridge) payable initializer {
        __TRC20BridgeableMock_init(initialBridge);
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

contract TRC721URIStorageMockUpgradeableWithInit is TRC721URIStorageMockUpgradeable {
    constructor() payable initializer {
        __TRC721URIStorageMock_init();
    }
}

contract TRC2771ContextMockUpgradeableWithInit is TRC2771ContextMockUpgradeable {
    constructor(address trustedForwarder) TRC2771ContextMockUpgradeable(trustedForwarder) payable initializer {

    }
}

contract TRC1155PausableUpgradeableWithInit is TRC1155PausableUpgradeable {
    constructor() payable initializer {
        __TRC1155Pausable_init();
    }
}

contract TRC20CrosschainUpgradeableWithInit is TRC20CrosschainUpgradeable {
    constructor() payable initializer {
        __TRC20Crosschain_init();
    }
}

contract TRC721RoyaltyUpgradeableWithInit is TRC721RoyaltyUpgradeable {
    constructor() payable initializer {
        __TRC721Royalty_init();
    }
}

contract AccessControlDefaultAdminRulesUpgradeableWithInit is AccessControlDefaultAdminRulesUpgradeable {
    constructor(uint48 initialDelay, address initialDefaultAdmin) payable initializer {
        __AccessControlDefaultAdminRules_init(initialDelay, initialDefaultAdmin);
    }
}

contract AccessControlEnumerableUpgradeableWithInit is AccessControlEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessControlEnumerable_init();
    }
}

contract BridgeTRC20UpgradeableWithInit is BridgeTRC20Upgradeable {
    constructor(ITRC20 token_) payable initializer {
        __BridgeTRC20_init(token_);
    }
}

contract BridgeTRC7802UpgradeableWithInit is BridgeTRC7802Upgradeable {
    constructor(ITRC7802 token_) payable initializer {
        __BridgeTRC7802_init(token_);
    }
}

contract VestingWalletCliffUpgradeableWithInit is VestingWalletCliffUpgradeable {
    constructor(uint64 cliffSeconds) payable initializer {
        __VestingWalletCliff_init(cliffSeconds);
    }
}

contract AccessManagerMockUpgradeableWithInit is AccessManagerMockUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManagerMock_init(initialAdmin);
    }
}

contract AccessControlModifiedUpgradeableWithInit is AccessControlModifiedUpgradeable {
    constructor() payable initializer {
        __AccessControlModified_init();
    }
}

contract AccessManagedTRC20MintUpgradeableWithInit is AccessManagedTRC20MintUpgradeable {
    constructor(address manager) payable initializer {
        __AccessManagedTRC20Mint_init(manager);
    }
}

contract AccessManagerEnumerableUpgradeableWithInit is AccessManagerEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessManagerEnumerable_init();
    }
}

contract MyNFTUpgradeableWithInit is MyNFTUpgradeable {
    constructor() payable initializer {
        __MyNFT_init();
    }
}

contract GameItemsUpgradeableWithInit is GameItemsUpgradeable {
    constructor() payable initializer {
        __GameItems_init();
    }
}

contract TRC4626FeesUpgradeableWithInit is TRC4626FeesUpgradeable {
    constructor() payable initializer {
        __TRC4626Fees_init();
    }
}

contract Base64NFTUpgradeableWithInit is Base64NFTUpgradeable {
    constructor() payable initializer {
        __Base64NFT_init();
    }
}

contract Dummy1234UpgradeableWithInit is Dummy1234Upgradeable {
    constructor() payable initializer {
        __Dummy1234_init();
    }
}

contract TRC20FlashMintMockUpgradeableWithInit is TRC20FlashMintMockUpgradeable {
    constructor() payable initializer {
        __TRC20FlashMintMock_init();
    }
}

contract TRC20MulticallMockUpgradeableWithInit is TRC20MulticallMockUpgradeable {
    constructor() payable initializer {
        __TRC20MulticallMock_init();
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

contract TRC1155BurnableUpgradeableWithInit is TRC1155BurnableUpgradeable {
    constructor() payable initializer {
        __TRC1155Burnable_init();
    }
}

contract TRC1155SupplyUpgradeableWithInit is TRC1155SupplyUpgradeable {
    constructor() payable initializer {
        __TRC1155Supply_init();
    }
}

contract TRC1155URIStorageUpgradeableWithInit is TRC1155URIStorageUpgradeable {
    constructor() payable initializer {
        __TRC1155URIStorage_init();
    }
}

contract TRC1363UpgradeableWithInit is TRC1363Upgradeable {
    constructor() payable initializer {
        __TRC1363_init();
    }
}

contract TRC20PausableUpgradeableWithInit is TRC20PausableUpgradeable {
    constructor() payable initializer {
        __TRC20Pausable_init();
    }
}

contract TRC6909ContentURIUpgradeableWithInit is TRC6909ContentURIUpgradeable {
    constructor() payable initializer {
        __TRC6909ContentURI_init();
    }
}

contract TRC6909TokenSupplyUpgradeableWithInit is TRC6909TokenSupplyUpgradeable {
    constructor() payable initializer {
        __TRC6909TokenSupply_init();
    }
}

contract TRC721BurnableUpgradeableWithInit is TRC721BurnableUpgradeable {
    constructor() payable initializer {
        __TRC721Burnable_init();
    }
}

contract TRC721URIStorageUpgradeableWithInit is TRC721URIStorageUpgradeable {
    constructor() payable initializer {
        __TRC721URIStorage_init();
    }
}

contract TRC721WrapperUpgradeableWithInit is TRC721WrapperUpgradeable {
    constructor(ITRC721 underlyingToken) payable initializer {
        __TRC721Wrapper_init(underlyingToken);
    }
}

contract AccessManagerUpgradeableWithInit is AccessManagerUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManager_init(initialAdmin);
    }
}

contract Ownable2StepUpgradeableWithInit is Ownable2StepUpgradeable {
    constructor() payable initializer {
        __Ownable2Step_init();
    }
}

contract VestingWalletUpgradeableWithInit is VestingWalletUpgradeable {
    constructor(address beneficiary, uint64 startTimestamp, uint64 durationSeconds) payable initializer {
        __VestingWallet_init(beneficiary, startTimestamp, durationSeconds);
    }
}

contract AccessManagedTargetUpgradeableWithInit is AccessManagedTargetUpgradeable {
    constructor() payable initializer {
        __AccessManagedTarget_init();
    }
}

contract MyContractUpgradeableWithInit is MyContractUpgradeable {
    constructor(address initialOwner) payable initializer {
        __MyContract_init(initialOwner);
    }
}

contract GLDTokenUpgradeableWithInit is GLDTokenUpgradeable {
    constructor(uint256 initialSupply) payable initializer {
        __GLDToken_init(initialSupply);
    }
}

contract TRC20WithAutoMinerRewardUpgradeableWithInit is TRC20WithAutoMinerRewardUpgradeable {
    constructor() payable initializer {
        __TRC20WithAutoMinerReward_init();
    }
}

contract BoxUpgradeableWithInit is BoxUpgradeable {
    constructor() payable initializer {
        __Box_init();
    }
}

contract PausableMockUpgradeableWithInit is PausableMockUpgradeable {
    constructor() payable initializer {
        __PausableMock_init();
    }
}

contract ReentrancyMockUpgradeableWithInit is ReentrancyMockUpgradeable {
    constructor() payable initializer {
        __ReentrancyMock_init();
    }
}

contract ReentrancyTransientMockUpgradeableWithInit is ReentrancyTransientMockUpgradeable {
    constructor() payable initializer {
        __ReentrancyTransientMock_init();
    }
}

contract StorageSlotMockUpgradeableWithInit is StorageSlotMockUpgradeable {
    constructor() payable initializer {
        __StorageSlotMock_init();
    }
}

contract TRC1155UpgradeableWithInit is TRC1155Upgradeable {
    constructor(string memory uri_) payable initializer {
        __TRC1155_init(uri_);
    }
}

contract TRC20FlashMintUpgradeableWithInit is TRC20FlashMintUpgradeable {
    constructor() payable initializer {
        __TRC20FlashMint_init();
    }
}

contract TRC4626UpgradeableWithInit is TRC4626Upgradeable {
    constructor(ITRC20 asset_) payable initializer {
        __TRC4626_init(asset_);
    }
}

contract AccessManagedUpgradeableWithInit is AccessManagedUpgradeable {
    constructor(address initialAuthority) payable initializer {
        __AccessManaged_init(initialAuthority);
    }
}

contract OwnableUpgradeableWithInit is OwnableUpgradeable {
    constructor(address initialOwner) payable initializer {
        __Ownable_init(initialOwner);
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

contract ReentrancyAttackUpgradeableWithInit is ReentrancyAttackUpgradeable {
    constructor() payable initializer {
        __ReentrancyAttack_init();
    }
}

contract TRC2981UpgradeableWithInit is TRC2981Upgradeable {
    constructor() payable initializer {
        __TRC2981_init();
    }
}

contract MulticallUpgradeableWithInit is MulticallUpgradeable {
    constructor() payable initializer {
        __Multicall_init();
    }
}
