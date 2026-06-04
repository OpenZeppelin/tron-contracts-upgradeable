// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../access/AccessControlUpgradeable.sol";

contract AccessControlUpgradeableWithInit is AccessControlUpgradeable {
    constructor() payable initializer {
        __AccessControl_init();
    }
}
import "../access/extensions/AccessControlDefaultAdminRulesUpgradeable.sol";

contract AccessControlDefaultAdminRulesUpgradeableWithInit is AccessControlDefaultAdminRulesUpgradeable {
    constructor(uint48 initialDelay, address initialDefaultAdmin) payable initializer {
        __AccessControlDefaultAdminRules_init(initialDelay, initialDefaultAdmin);
    }
}
import "../access/extensions/AccessControlEnumerableUpgradeable.sol";

contract AccessControlEnumerableUpgradeableWithInit is AccessControlEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessControlEnumerable_init();
    }
}
import "../access/manager/AccessManagedUpgradeable.sol";

contract AccessManagedUpgradeableWithInit is AccessManagedUpgradeable {
    constructor(address initialAuthority) payable initializer {
        __AccessManaged_init(initialAuthority);
    }
}
import "../access/manager/AccessManagerUpgradeable.sol";

contract AccessManagerUpgradeableWithInit is AccessManagerUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManager_init(initialAdmin);
    }
}
import "../access/OwnableUpgradeable.sol";

contract OwnableUpgradeableWithInit is OwnableUpgradeable {
    constructor(address initialOwner) payable initializer {
        __Ownable_init(initialOwner);
    }
}
import "../access/Ownable2StepUpgradeable.sol";

contract Ownable2StepUpgradeableWithInit is Ownable2StepUpgradeable {
    constructor() payable initializer {
        __Ownable2Step_init();
    }
}
import "../crosschain/bridges/BridgeERC20Upgradeable.sol";

contract BridgeERC20UpgradeableWithInit is BridgeERC20Upgradeable {
    constructor(ITRC20 token_) payable initializer {
        __BridgeERC20_init(token_);
    }
}
import "../crosschain/bridges/BridgeERC7802Upgradeable.sol";

contract BridgeERC7802UpgradeableWithInit is BridgeERC7802Upgradeable {
    constructor(IERC7802 token_) payable initializer {
        __BridgeERC7802_init(token_);
    }
}
import "../finance/VestingWalletUpgradeable.sol";

contract VestingWalletUpgradeableWithInit is VestingWalletUpgradeable {
    constructor(address beneficiary, uint64 startTimestamp, uint64 durationSeconds) payable initializer {
        __VestingWallet_init(beneficiary, startTimestamp, durationSeconds);
    }
}
import "../finance/VestingWalletCliffUpgradeable.sol";

contract VestingWalletCliffUpgradeableWithInit is VestingWalletCliffUpgradeable {
    constructor(uint64 cliffSeconds) payable initializer {
        __VestingWalletCliff_init(cliffSeconds);
    }
}
import "../governance/TimelockControllerUpgradeable.sol";

contract TimelockControllerUpgradeableWithInit is TimelockControllerUpgradeable {
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors, address admin) payable initializer {
        __TimelockController_init(minDelay, proposers, executors, admin);
    }
}
import "../metatx/ERC2771ContextUpgradeable.sol";

contract ERC2771ContextUpgradeableWithInit is ERC2771ContextUpgradeable {
    constructor(address trustedForwarder_) ERC2771ContextUpgradeable(trustedForwarder_) payable initializer {

    }
}
import "../metatx/ERC2771ForwarderUpgradeable.sol";

contract ERC2771ForwarderUpgradeableWithInit is ERC2771ForwarderUpgradeable {
    constructor(string memory name) payable initializer {
        __ERC2771Forwarder_init(name);
    }
}
import "./AccessManagedTargetUpgradeable.sol";

contract AccessManagedTargetUpgradeableWithInit is AccessManagedTargetUpgradeable {
    constructor() payable initializer {
        __AccessManagedTarget_init();
    }
}
import "./AccessManagerMockUpgradeable.sol";

contract AccessManagerMockUpgradeableWithInit is AccessManagerMockUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManagerMock_init(initialAdmin);
    }
}
import "./ArraysMockUpgradeable.sol";

contract Uint256ArraysMockUpgradeableWithInit is Uint256ArraysMockUpgradeable {
    constructor(uint256[] memory array) payable initializer {
        __Uint256ArraysMock_init(array);
    }
}
import "./ArraysMockUpgradeable.sol";

contract AddressArraysMockUpgradeableWithInit is AddressArraysMockUpgradeable {
    constructor(address[] memory array) payable initializer {
        __AddressArraysMock_init(array);
    }
}
import "./ArraysMockUpgradeable.sol";

contract Bytes32ArraysMockUpgradeableWithInit is Bytes32ArraysMockUpgradeable {
    constructor(bytes32[] memory array) payable initializer {
        __Bytes32ArraysMock_init(array);
    }
}
import "./ArraysMockUpgradeable.sol";

contract BytesArraysMockUpgradeableWithInit is BytesArraysMockUpgradeable {
    constructor(bytes[] memory array) payable initializer {
        __BytesArraysMock_init(array);
    }
}
import "./ArraysMockUpgradeable.sol";

contract StringArraysMockUpgradeableWithInit is StringArraysMockUpgradeable {
    constructor(string[] memory array) payable initializer {
        __StringArraysMock_init(array);
    }
}
import "./AuthorityMockUpgradeable.sol";

contract NotAuthorityMockUpgradeableWithInit is NotAuthorityMockUpgradeable {
    constructor() payable initializer {
        __NotAuthorityMock_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityNoDelayMockUpgradeableWithInit is AuthorityNoDelayMockUpgradeable {
    constructor() payable initializer {
        __AuthorityNoDelayMock_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityDelayMockUpgradeableWithInit is AuthorityDelayMockUpgradeable {
    constructor() payable initializer {
        __AuthorityDelayMock_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityNoResponseUpgradeableWithInit is AuthorityNoResponseUpgradeable {
    constructor() payable initializer {
        __AuthorityNoResponse_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityObserveIsConsumingUpgradeableWithInit is AuthorityObserveIsConsumingUpgradeable {
    constructor() payable initializer {
        __AuthorityObserveIsConsuming_init();
    }
}
import "./Base64DirtyUpgradeable.sol";

contract Base64DirtyUpgradeableWithInit is Base64DirtyUpgradeable {
    constructor() payable initializer {
        __Base64Dirty_init();
    }
}
import "./BatchCallerUpgradeable.sol";

contract BatchCallerUpgradeableWithInit is BatchCallerUpgradeable {
    constructor() payable initializer {
        __BatchCaller_init();
    }
}
import "./CallReceiverMockUpgradeable.sol";

contract CallReceiverMockUpgradeableWithInit is CallReceiverMockUpgradeable {
    constructor() payable initializer {
        __CallReceiverMock_init();
    }
}
import "./CallReceiverMockUpgradeable.sol";

contract CallReceiverMockTrustingForwarderUpgradeableWithInit is CallReceiverMockTrustingForwarderUpgradeable {
    constructor(address trustedForwarder_) payable initializer {
        __CallReceiverMockTrustingForwarder_init(trustedForwarder_);
    }
}
import "./compound/CompTimelockUpgradeable.sol";

contract CompTimelockUpgradeableWithInit is CompTimelockUpgradeable {
    constructor(address admin_, uint256 delay_) payable initializer {
        __CompTimelock_init(admin_, delay_);
    }
}
import "./ConstructorMockUpgradeable.sol";

contract ConstructorMockUpgradeableWithInit is ConstructorMockUpgradeable {
    constructor(RevertType error) payable initializer {
        __ConstructorMock_init(error);
    }
}
import "./ContextMockUpgradeable.sol";

contract ContextMockUpgradeableWithInit is ContextMockUpgradeable {
    constructor() payable initializer {
        __ContextMock_init();
    }
}
import "./ContextMockUpgradeable.sol";

contract ContextMockCallerUpgradeableWithInit is ContextMockCallerUpgradeable {
    constructor() payable initializer {
        __ContextMockCaller_init();
    }
}
import "./crosschain/ERC7786GatewayMockUpgradeable.sol";

contract ERC7786GatewayMockUpgradeableWithInit is ERC7786GatewayMockUpgradeable {
    constructor() payable initializer {
        __ERC7786GatewayMock_init();
    }
}
import "./crosschain/ERC7786RecipientMockUpgradeable.sol";

contract ERC7786RecipientMockUpgradeableWithInit is ERC7786RecipientMockUpgradeable {
    constructor(address gateway_) payable initializer {
        __ERC7786RecipientMock_init(gateway_);
    }
}
import "./docs/access-control/AccessControlModifiedUpgradeable.sol";

contract AccessControlModifiedUpgradeableWithInit is AccessControlModifiedUpgradeable {
    constructor() payable initializer {
        __AccessControlModified_init();
    }
}
import "./docs/access-control/AccessControlTRC20MintBaseUpgradeable.sol";

contract AccessControlTRC20MintBaseUpgradeableWithInit is AccessControlTRC20MintBaseUpgradeable {
    constructor(address minter) payable initializer {
        __AccessControlTRC20MintBase_init(minter);
    }
}
import "./docs/access-control/AccessControlTRC20MintMissingUpgradeable.sol";

contract AccessControlTRC20MintMissingUpgradeableWithInit is AccessControlTRC20MintMissingUpgradeable {
    constructor() payable initializer {
        __AccessControlTRC20MintMissing_init();
    }
}
import "./docs/access-control/AccessControlTRC20MintOnlyRoleUpgradeable.sol";

contract AccessControlTRC20MintUpgradeableWithInit is AccessControlTRC20MintUpgradeable {
    constructor(address minter, address burner) payable initializer {
        __AccessControlTRC20Mint_init(minter, burner);
    }
}
import "./docs/access-control/AccessManagedTRC20MintBaseUpgradeable.sol";

contract AccessManagedTRC20MintUpgradeableWithInit is AccessManagedTRC20MintUpgradeable {
    constructor(address manager) payable initializer {
        __AccessManagedTRC20Mint_init(manager);
    }
}
import "./docs/access-control/MyContractOwnableUpgradeable.sol";

contract MyContractUpgradeableWithInit is MyContractUpgradeable {
    constructor(address initialOwner) payable initializer {
        __MyContract_init(initialOwner);
    }
}
import "./docs/AccessManagerEnumerableUpgradeable.sol";

contract AccessManagerEnumerableUpgradeableWithInit is AccessManagerEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessManagerEnumerable_init();
    }
}
import "./docs/governance/MyGovernorUpgradeable.sol";

contract MyGovernorUpgradeableWithInit is MyGovernorUpgradeable {
    constructor(
        IVotes _token,
        TimelockControllerUpgradeable _timelock
    ) payable initializer {
        __MyGovernor_init(_token, _timelock);
    }
}
import "./docs/governance/MyTokenUpgradeable.sol";

contract MyTokenUpgradeableWithInit is MyTokenUpgradeable {
    constructor() payable initializer {
        __MyToken_init();
    }
}
import "./docs/governance/MyTokenTimestampBasedUpgradeable.sol";

contract MyTokenTimestampBasedUpgradeableWithInit is MyTokenTimestampBasedUpgradeable {
    constructor() payable initializer {
        __MyTokenTimestampBased_init();
    }
}
import "./docs/governance/MyTokenWrappedUpgradeable.sol";

contract MyTokenWrappedUpgradeableWithInit is MyTokenWrappedUpgradeable {
    constructor(
        ITRC20 wrappedToken
    ) payable initializer {
        __MyTokenWrapped_init(wrappedToken);
    }
}
import "./docs/MyNFTUpgradeable.sol";

contract MyNFTUpgradeableWithInit is MyNFTUpgradeable {
    constructor() payable initializer {
        __MyNFT_init();
    }
}
import "./docs/token/ERC6909/ERC6909GameItemsUpgradeable.sol";

contract ERC6909GameItemsUpgradeableWithInit is ERC6909GameItemsUpgradeable {
    constructor() payable initializer {
        __ERC6909GameItems_init();
    }
}
import "./docs/token/TRC1155/GameItemsUpgradeable.sol";

contract GameItemsUpgradeableWithInit is GameItemsUpgradeable {
    constructor() payable initializer {
        __GameItems_init();
    }
}
import "./docs/token/TRC1155/MyTRC1155HolderContractUpgradeable.sol";

contract MyTRC1155HolderContractUpgradeableWithInit is MyTRC1155HolderContractUpgradeable {
    constructor() payable initializer {
        __MyTRC1155HolderContract_init();
    }
}
import "./docs/token/TRC20/GLDTokenUpgradeable.sol";

contract GLDTokenUpgradeableWithInit is GLDTokenUpgradeable {
    constructor(uint256 initialSupply) payable initializer {
        __GLDToken_init(initialSupply);
    }
}
import "./docs/token/TRC721/GameItemUpgradeable.sol";

contract GameItemUpgradeableWithInit is GameItemUpgradeable {
    constructor() payable initializer {
        __GameItem_init();
    }
}
import "./docs/TRC20WithAutoMinerRewardUpgradeable.sol";

contract TRC20WithAutoMinerRewardUpgradeableWithInit is TRC20WithAutoMinerRewardUpgradeable {
    constructor() payable initializer {
        __TRC20WithAutoMinerReward_init();
    }
}
import "./docs/TRC4626FeesUpgradeable.sol";

contract TRC4626FeesUpgradeableWithInit is TRC4626FeesUpgradeable {
    constructor() payable initializer {
        __TRC4626Fees_init();
    }
}
import "./docs/utilities/Base64NFTUpgradeable.sol";

contract Base64NFTUpgradeableWithInit is Base64NFTUpgradeable {
    constructor() payable initializer {
        __Base64NFT_init();
    }
}
import "./docs/utilities/MulticallUpgradeable.sol";

contract BoxUpgradeableWithInit is BoxUpgradeable {
    constructor() payable initializer {
        __Box_init();
    }
}
import "./DummyImplementationUpgradeable.sol";

contract DummyImplementationUpgradeableWithInit is DummyImplementationUpgradeable {
    constructor() payable initializer {
        __DummyImplementation_init();
    }
}
import "./DummyImplementationUpgradeable.sol";

contract DummyImplementationV2UpgradeableWithInit is DummyImplementationV2Upgradeable {
    constructor() payable initializer {
        __DummyImplementationV2_init();
    }
}
import "./EIP712VerifierUpgradeable.sol";

contract EIP712VerifierUpgradeableWithInit is EIP712VerifierUpgradeable {
    constructor() payable initializer {
        __EIP712Verifier_init();
    }
}
import "./ERC1271WalletMockUpgradeable.sol";

contract ERC1271WalletMockUpgradeableWithInit is ERC1271WalletMockUpgradeable {
    constructor(address originalOwner) payable initializer {
        __ERC1271WalletMock_init(originalOwner);
    }
}
import "./ERC1271WalletMockUpgradeable.sol";

contract ERC1271MaliciousMockUpgradeableWithInit is ERC1271MaliciousMockUpgradeable {
    constructor() payable initializer {
        __ERC1271MaliciousMock_init();
    }
}
import "./ERC165MockUpgradeable.sol";

contract SupportsInterfaceWithLookupMockUpgradeableWithInit is SupportsInterfaceWithLookupMockUpgradeable {
    constructor() payable initializer {
        __SupportsInterfaceWithLookupMock_init();
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165InterfacesSupportedUpgradeableWithInit is ERC165InterfacesSupportedUpgradeable {
    constructor(bytes4[] memory interfaceIds) payable initializer {
        __ERC165InterfacesSupported_init(interfaceIds);
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165RevertInvalidUpgradeableWithInit is ERC165RevertInvalidUpgradeable {
    constructor(bytes4[] memory interfaceIds) payable initializer {
        __ERC165RevertInvalid_init(interfaceIds);
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165MaliciousDataUpgradeableWithInit is ERC165MaliciousDataUpgradeable {
    constructor() payable initializer {
        __ERC165MaliciousData_init();
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165MissingDataUpgradeableWithInit is ERC165MissingDataUpgradeable {
    constructor() payable initializer {
        __ERC165MissingData_init();
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165NotSupportedUpgradeableWithInit is ERC165NotSupportedUpgradeable {
    constructor() payable initializer {
        __ERC165NotSupported_init();
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165ReturnBombMockUpgradeableWithInit is ERC165ReturnBombMockUpgradeable {
    constructor() payable initializer {
        __ERC165ReturnBombMock_init();
    }
}
import "./ERC2771ContextMockUpgradeable.sol";

contract ERC2771ContextMockUpgradeableWithInit is ERC2771ContextMockUpgradeable {
    constructor(address trustedForwarder) ERC2771ContextMockUpgradeable(trustedForwarder) payable initializer {

    }
}
import "./ERC3156FlashBorrowerMockUpgradeable.sol";

contract ERC3156FlashBorrowerMockUpgradeableWithInit is ERC3156FlashBorrowerMockUpgradeable {
    constructor(bool enableReturn, bool enableApprove) payable initializer {
        __ERC3156FlashBorrowerMock_init(enableReturn, enableApprove);
    }
}
import "./EtherReceiverMockUpgradeable.sol";

contract EtherReceiverMockUpgradeableWithInit is EtherReceiverMockUpgradeable {
    constructor() payable initializer {
        __EtherReceiverMock_init();
    }
}
import "./governance/GovernorCountingOverridableMockUpgradeable.sol";

contract GovernorCountingOverridableMockUpgradeableWithInit is GovernorCountingOverridableMockUpgradeable {
    constructor() payable initializer {
        __GovernorCountingOverridableMock_init();
    }
}
import "./governance/GovernorFractionalMockUpgradeable.sol";

contract GovernorFractionalMockUpgradeableWithInit is GovernorFractionalMockUpgradeable {
    constructor() payable initializer {
        __GovernorFractionalMock_init();
    }
}
import "./governance/GovernorMockUpgradeable.sol";

contract GovernorMockUpgradeableWithInit is GovernorMockUpgradeable {
    constructor() payable initializer {
        __GovernorMock_init();
    }
}
import "./governance/GovernorNoncesKeyedMockUpgradeable.sol";

contract GovernorNoncesKeyedMockUpgradeableWithInit is GovernorNoncesKeyedMockUpgradeable {
    constructor() payable initializer {
        __GovernorNoncesKeyedMock_init();
    }
}
import "./governance/GovernorPreventLateQuorumMockUpgradeable.sol";

contract GovernorPreventLateQuorumMockUpgradeableWithInit is GovernorPreventLateQuorumMockUpgradeable {
    constructor(uint256 quorum_) payable initializer {
        __GovernorPreventLateQuorumMock_init(quorum_);
    }
}
import "./governance/GovernorProposalGuardianMockUpgradeable.sol";

contract GovernorProposalGuardianMockUpgradeableWithInit is GovernorProposalGuardianMockUpgradeable {
    constructor() payable initializer {
        __GovernorProposalGuardianMock_init();
    }
}
import "./governance/GovernorSequentialProposalIdMockUpgradeable.sol";

contract GovernorSequentialProposalIdMockUpgradeableWithInit is GovernorSequentialProposalIdMockUpgradeable {
    constructor() payable initializer {
        __GovernorSequentialProposalIdMock_init();
    }
}
import "./governance/GovernorStorageMockUpgradeable.sol";

contract GovernorStorageMockUpgradeableWithInit is GovernorStorageMockUpgradeable {
    constructor() payable initializer {
        __GovernorStorageMock_init();
    }
}
import "./governance/GovernorSuperQuorumMockUpgradeable.sol";

contract GovernorSuperQuorumMockUpgradeableWithInit is GovernorSuperQuorumMockUpgradeable {
    constructor(uint256 quorum_, uint256 superQuorum_) payable initializer {
        __GovernorSuperQuorumMock_init(quorum_, superQuorum_);
    }
}
import "./governance/GovernorTimelockAccessMockUpgradeable.sol";

contract GovernorTimelockAccessMockUpgradeableWithInit is GovernorTimelockAccessMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockAccessMock_init();
    }
}
import "./governance/GovernorTimelockCompoundMockUpgradeable.sol";

contract GovernorTimelockCompoundMockUpgradeableWithInit is GovernorTimelockCompoundMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockCompoundMock_init();
    }
}
import "./governance/GovernorTimelockControlMockUpgradeable.sol";

contract GovernorTimelockControlMockUpgradeableWithInit is GovernorTimelockControlMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockControlMock_init();
    }
}
import "./governance/GovernorVoteMockUpgradeable.sol";

contract GovernorVoteMocksUpgradeableWithInit is GovernorVoteMocksUpgradeable {
    constructor() payable initializer {
        __GovernorVoteMocks_init();
    }
}
import "./governance/GovernorVotesSuperQuorumFractionMockUpgradeable.sol";

contract GovernorVotesSuperQuorumFractionMockUpgradeableWithInit is GovernorVotesSuperQuorumFractionMockUpgradeable {
    constructor() payable initializer {
        __GovernorVotesSuperQuorumFractionMock_init();
    }
}
import "./governance/GovernorWithParamsMockUpgradeable.sol";

contract GovernorWithParamsMockUpgradeableWithInit is GovernorWithParamsMockUpgradeable {
    constructor() payable initializer {
        __GovernorWithParamsMock_init();
    }
}
import "./MerkleProofCustomHashMockUpgradeable.sol";

contract MerkleProofCustomHashMockUpgradeableWithInit is MerkleProofCustomHashMockUpgradeable {
    constructor() payable initializer {
        __MerkleProofCustomHashMock_init();
    }
}
import "./MerkleTreeMockUpgradeable.sol";

contract MerkleTreeMockUpgradeableWithInit is MerkleTreeMockUpgradeable {
    constructor() payable initializer {
        __MerkleTreeMock_init();
    }
}
import "./MulticallHelperUpgradeable.sol";

contract MulticallHelperUpgradeableWithInit is MulticallHelperUpgradeable {
    constructor() payable initializer {
        __MulticallHelper_init();
    }
}
import "./PausableMockUpgradeable.sol";

contract PausableMockUpgradeableWithInit is PausableMockUpgradeable {
    constructor() payable initializer {
        __PausableMock_init();
    }
}
import "./proxy/BadBeaconUpgradeable.sol";

contract BadBeaconNoImplUpgradeableWithInit is BadBeaconNoImplUpgradeable {
    constructor() payable initializer {
        __BadBeaconNoImpl_init();
    }
}
import "./proxy/BadBeaconUpgradeable.sol";

contract BadBeaconNotContractUpgradeableWithInit is BadBeaconNotContractUpgradeable {
    constructor() payable initializer {
        __BadBeaconNotContract_init();
    }
}
import "./proxy/ClashingImplementationUpgradeable.sol";

contract ClashingImplementationUpgradeableWithInit is ClashingImplementationUpgradeable {
    constructor() payable initializer {
        __ClashingImplementation_init();
    }
}
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract NonUpgradeableMockUpgradeableWithInit is NonUpgradeableMockUpgradeable {
    constructor() payable initializer {
        __NonUpgradeableMock_init();
    }
}
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract UUPSUpgradeableMockUpgradeableWithInit is UUPSUpgradeableMockUpgradeable {
    constructor() payable initializer {
        __UUPSUpgradeableMock_init();
    }
}
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract UUPSUpgradeableUnsafeMockUpgradeableWithInit is UUPSUpgradeableUnsafeMockUpgradeable {
    constructor() payable initializer {
        __UUPSUpgradeableUnsafeMock_init();
    }
}
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract UUPSUnsupportedProxiableUUIDMockUpgradeableWithInit is UUPSUnsupportedProxiableUUIDMockUpgradeable {
    constructor() payable initializer {
        __UUPSUnsupportedProxiableUUIDMock_init();
    }
}
import "./ReentrancyAttackUpgradeable.sol";

contract ReentrancyAttackUpgradeableWithInit is ReentrancyAttackUpgradeable {
    constructor() payable initializer {
        __ReentrancyAttack_init();
    }
}
import "./ReentrancyMockUpgradeable.sol";

contract ReentrancyMockUpgradeableWithInit is ReentrancyMockUpgradeable {
    constructor() payable initializer {
        __ReentrancyMock_init();
    }
}
import "./ReentrancyTransientMockUpgradeable.sol";

contract ReentrancyTransientMockUpgradeableWithInit is ReentrancyTransientMockUpgradeable {
    constructor() payable initializer {
        __ReentrancyTransientMock_init();
    }
}
import "./StatelessUpgradeable.sol";

contract Dummy1234UpgradeableWithInit is Dummy1234Upgradeable {
    constructor() payable initializer {
        __Dummy1234_init();
    }
}
import "./StorageSlotMockUpgradeable.sol";

contract StorageSlotMockUpgradeableWithInit is StorageSlotMockUpgradeable {
    constructor() payable initializer {
        __StorageSlotMock_init();
    }
}
import "./TimelockReentrantUpgradeable.sol";

contract TimelockReentrantUpgradeableWithInit is TimelockReentrantUpgradeable {
    constructor() payable initializer {
        __TimelockReentrant_init();
    }
}
import "./token/ERC1363ForceApproveMockUpgradeable.sol";

contract ERC1363ForceApproveMockUpgradeableWithInit is ERC1363ForceApproveMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ForceApproveMock_init();
    }
}
import "./token/ERC1363NoReturnMockUpgradeable.sol";

contract ERC1363NoReturnMockUpgradeableWithInit is ERC1363NoReturnMockUpgradeable {
    constructor() payable initializer {
        __ERC1363NoReturnMock_init();
    }
}
import "./token/ERC1363ReceiverMockUpgradeable.sol";

contract ERC1363ReceiverMockUpgradeableWithInit is ERC1363ReceiverMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReceiverMock_init();
    }
}
import "./token/ERC1363ReturnFalseMockUpgradeable.sol";

contract ERC1363ReturnFalseOnTRC20MockUpgradeableWithInit is ERC1363ReturnFalseOnTRC20MockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReturnFalseOnTRC20Mock_init();
    }
}
import "./token/ERC1363ReturnFalseMockUpgradeable.sol";

contract ERC1363ReturnFalseMockUpgradeableWithInit is ERC1363ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReturnFalseMock_init();
    }
}
import "./token/ERC1363SpenderMockUpgradeable.sol";

contract ERC1363SpenderMockUpgradeableWithInit is ERC1363SpenderMockUpgradeable {
    constructor() payable initializer {
        __ERC1363SpenderMock_init();
    }
}
import "./token/TRC1155ReceiverMockUpgradeable.sol";

contract TRC1155ReceiverMockUpgradeableWithInit is TRC1155ReceiverMockUpgradeable {
    constructor(bytes4 recRetval, bytes4 batRetval, RevertType error) payable initializer {
        __TRC1155ReceiverMock_init(recRetval, batRetval, error);
    }
}
import "./token/TRC20ApprovalMockUpgradeable.sol";

contract TRC20ApprovalMockUpgradeableWithInit is TRC20ApprovalMockUpgradeable {
    constructor() payable initializer {
        __TRC20ApprovalMock_init();
    }
}
import "./token/TRC20BridgeableMockUpgradeable.sol";

contract TRC20BridgeableMockUpgradeableWithInit is TRC20BridgeableMockUpgradeable {
    constructor(address initialBridge) payable initializer {
        __TRC20BridgeableMock_init(initialBridge);
    }
}
import "./token/TRC20DecimalsMockUpgradeable.sol";

contract TRC20DecimalsMockUpgradeableWithInit is TRC20DecimalsMockUpgradeable {
    constructor(uint8 decimals_) payable initializer {
        __TRC20DecimalsMock_init(decimals_);
    }
}
import "./token/TRC20ExcessDecimalsMockUpgradeable.sol";

contract TRC20ExcessDecimalsMockUpgradeableWithInit is TRC20ExcessDecimalsMockUpgradeable {
    constructor() payable initializer {
        __TRC20ExcessDecimalsMock_init();
    }
}
import "./token/TRC20FlashMintMockUpgradeable.sol";

contract TRC20FlashMintMockUpgradeableWithInit is TRC20FlashMintMockUpgradeable {
    constructor() payable initializer {
        __TRC20FlashMintMock_init();
    }
}
import "./token/TRC20ForceApproveMockUpgradeable.sol";

contract TRC20ForceApproveMockUpgradeableWithInit is TRC20ForceApproveMockUpgradeable {
    constructor() payable initializer {
        __TRC20ForceApproveMock_init();
    }
}
import "./token/TRC20GetterHelperUpgradeable.sol";

contract TRC20GetterHelperUpgradeableWithInit is TRC20GetterHelperUpgradeable {
    constructor() payable initializer {
        __TRC20GetterHelper_init();
    }
}
import "./token/TRC20MockUpgradeable.sol";

contract TRC20MockUpgradeableWithInit is TRC20MockUpgradeable {
    constructor() payable initializer {
        __TRC20Mock_init();
    }
}
import "./token/TRC20MulticallMockUpgradeable.sol";

contract TRC20MulticallMockUpgradeableWithInit is TRC20MulticallMockUpgradeable {
    constructor() payable initializer {
        __TRC20MulticallMock_init();
    }
}
import "./token/TRC20NoReturnMockUpgradeable.sol";

contract TRC20NoReturnMockUpgradeableWithInit is TRC20NoReturnMockUpgradeable {
    constructor() payable initializer {
        __TRC20NoReturnMock_init();
    }
}
import "./token/TRC20ReentrantUpgradeable.sol";

contract TRC20ReentrantUpgradeableWithInit is TRC20ReentrantUpgradeable {
    constructor() payable initializer {
        __TRC20Reentrant_init();
    }
}
import "./token/TRC20ReturnFalseMockUpgradeable.sol";

contract TRC20ReturnFalseMockUpgradeableWithInit is TRC20ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __TRC20ReturnFalseMock_init();
    }
}
import "./token/TRC20VotesAdditionalCheckpointsMockUpgradeable.sol";

contract TRC20VotesExtendedMockUpgradeableWithInit is TRC20VotesExtendedMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesExtendedMock_init();
    }
}
import "./token/TRC20VotesAdditionalCheckpointsMockUpgradeable.sol";

contract TRC20VotesExtendedTimestampMockUpgradeableWithInit is TRC20VotesExtendedTimestampMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesExtendedTimestampMock_init();
    }
}
import "./token/TRC20VotesLegacyMockUpgradeable.sol";

contract TRC20VotesLegacyMockUpgradeableWithInit is TRC20VotesLegacyMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesLegacyMock_init();
    }
}
import "./token/TRC20VotesTimestampMockUpgradeable.sol";

contract TRC20VotesTimestampMockUpgradeableWithInit is TRC20VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesTimestampMock_init();
    }
}
import "./token/TRC20VotesTimestampMockUpgradeable.sol";

contract TRC721VotesTimestampMockUpgradeableWithInit is TRC721VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __TRC721VotesTimestampMock_init();
    }
}
import "./token/TRC4626FeesMockUpgradeable.sol";

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
import "./token/TRC4626LimitsMockUpgradeable.sol";

contract TRC4626LimitsMockUpgradeableWithInit is TRC4626LimitsMockUpgradeable {
    constructor() payable initializer {
        __TRC4626LimitsMock_init();
    }
}
import "./token/TRC4626MockUpgradeable.sol";

contract TRC4626MockUpgradeableWithInit is TRC4626MockUpgradeable {
    constructor(address underlying) payable initializer {
        __TRC4626Mock_init(underlying);
    }
}
import "./token/TRC4626OffsetMockUpgradeable.sol";

contract TRC4626OffsetMockUpgradeableWithInit is TRC4626OffsetMockUpgradeable {
    constructor(uint8 offset_) payable initializer {
        __TRC4626OffsetMock_init(offset_);
    }
}
import "./token/TRC721ConsecutiveEnumerableMockUpgradeable.sol";

contract TRC721ConsecutiveEnumerableMockUpgradeableWithInit is TRC721ConsecutiveEnumerableMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address[] memory receivers,
        uint96[] memory amounts
    ) payable initializer {
        __TRC721ConsecutiveEnumerableMock_init(name, symbol, receivers, amounts);
    }
}
import "./token/TRC721ConsecutiveMockUpgradeable.sol";

contract TRC721ConsecutiveMockUpgradeableWithInit is TRC721ConsecutiveMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        uint96 offset,
        address[] memory delegates,
        address[] memory receivers,
        uint96[] memory amounts
    ) payable initializer {
        __TRC721ConsecutiveMock_init(name, symbol, offset, delegates, receivers, amounts);
    }
}
import "./token/TRC721ConsecutiveMockUpgradeable.sol";

contract TRC721ConsecutiveNoConstructorMintMockUpgradeableWithInit is TRC721ConsecutiveNoConstructorMintMockUpgradeable {
    constructor(string memory name, string memory symbol) payable initializer {
        __TRC721ConsecutiveNoConstructorMintMock_init(name, symbol);
    }
}
import "./token/TRC721ReceiverMockUpgradeable.sol";

contract TRC721ReceiverMockUpgradeableWithInit is TRC721ReceiverMockUpgradeable {
    constructor(bytes4 retval, RevertType error) payable initializer {
        __TRC721ReceiverMock_init(retval, error);
    }
}
import "./token/TRC721URIStorageMockUpgradeable.sol";

contract TRC721URIStorageMockUpgradeableWithInit is TRC721URIStorageMockUpgradeable {
    constructor() payable initializer {
        __TRC721URIStorageMock_init();
    }
}
import "./TransientSlotMockUpgradeable.sol";

contract TransientSlotMockUpgradeableWithInit is TransientSlotMockUpgradeable {
    constructor() payable initializer {
        __TransientSlotMock_init();
    }
}
import "./UpgradeableBeaconMockUpgradeable.sol";

contract UpgradeableBeaconMockUpgradeableWithInit is UpgradeableBeaconMockUpgradeable {
    constructor(address impl) payable initializer {
        __UpgradeableBeaconMock_init(impl);
    }
}
import "./UpgradeableBeaconMockUpgradeable.sol";

contract UpgradeableBeaconReentrantMockUpgradeableWithInit is UpgradeableBeaconReentrantMockUpgradeable {
    constructor() payable initializer {
        __UpgradeableBeaconReentrantMock_init();
    }
}
import "./utils/cryptography/ERC7739MockUpgradeable.sol";

contract ERC7739ECDSAMockUpgradeableWithInit is ERC7739ECDSAMockUpgradeable {
    constructor() payable initializer {
        __ERC7739ECDSAMock_init();
    }
}
import "./utils/cryptography/ERC7739MockUpgradeable.sol";

contract ERC7739P256MockUpgradeableWithInit is ERC7739P256MockUpgradeable {
    constructor() payable initializer {
        __ERC7739P256Mock_init();
    }
}
import "./utils/cryptography/ERC7739MockUpgradeable.sol";

contract ERC7739RSAMockUpgradeableWithInit is ERC7739RSAMockUpgradeable {
    constructor() payable initializer {
        __ERC7739RSAMock_init();
    }
}
import "./VotesExtendedMockUpgradeable.sol";

contract VotesExtendedMockUpgradeableWithInit is VotesExtendedMockUpgradeable {
    constructor() payable initializer {
        __VotesExtendedMock_init();
    }
}
import "./VotesExtendedMockUpgradeable.sol";

contract VotesExtendedTimestampMockUpgradeableWithInit is VotesExtendedTimestampMockUpgradeable {
    constructor() payable initializer {
        __VotesExtendedTimestampMock_init();
    }
}
import "./VotesMockUpgradeable.sol";

contract VotesMockUpgradeableWithInit is VotesMockUpgradeable {
    constructor() payable initializer {
        __VotesMock_init();
    }
}
import "./VotesMockUpgradeable.sol";

contract VotesTimestampMockUpgradeableWithInit is VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __VotesTimestampMock_init();
    }
}
import "../token/common/ERC2981Upgradeable.sol";

contract ERC2981UpgradeableWithInit is ERC2981Upgradeable {
    constructor() payable initializer {
        __ERC2981_init();
    }
}
import "../token/ERC6909/ERC6909Upgradeable.sol";

contract ERC6909UpgradeableWithInit is ERC6909Upgradeable {
    constructor() payable initializer {
        __ERC6909_init();
    }
}
import "../token/ERC6909/extensions/ERC6909ContentURIUpgradeable.sol";

contract ERC6909ContentURIUpgradeableWithInit is ERC6909ContentURIUpgradeable {
    constructor() payable initializer {
        __ERC6909ContentURI_init();
    }
}
import "../token/ERC6909/extensions/ERC6909MetadataUpgradeable.sol";

contract ERC6909MetadataUpgradeableWithInit is ERC6909MetadataUpgradeable {
    constructor() payable initializer {
        __ERC6909Metadata_init();
    }
}
import "../token/ERC6909/extensions/ERC6909TokenSupplyUpgradeable.sol";

contract ERC6909TokenSupplyUpgradeableWithInit is ERC6909TokenSupplyUpgradeable {
    constructor() payable initializer {
        __ERC6909TokenSupply_init();
    }
}
import "../token/TRC1155/extensions/TRC1155BurnableUpgradeable.sol";

contract TRC1155BurnableUpgradeableWithInit is TRC1155BurnableUpgradeable {
    constructor() payable initializer {
        __TRC1155Burnable_init();
    }
}
import "../token/TRC1155/extensions/TRC1155PausableUpgradeable.sol";

contract TRC1155PausableUpgradeableWithInit is TRC1155PausableUpgradeable {
    constructor() payable initializer {
        __TRC1155Pausable_init();
    }
}
import "../token/TRC1155/extensions/TRC1155SupplyUpgradeable.sol";

contract TRC1155SupplyUpgradeableWithInit is TRC1155SupplyUpgradeable {
    constructor() payable initializer {
        __TRC1155Supply_init();
    }
}
import "../token/TRC1155/extensions/TRC1155URIStorageUpgradeable.sol";

contract TRC1155URIStorageUpgradeableWithInit is TRC1155URIStorageUpgradeable {
    constructor() payable initializer {
        __TRC1155URIStorage_init();
    }
}
import "../token/TRC1155/TRC1155Upgradeable.sol";

contract TRC1155UpgradeableWithInit is TRC1155Upgradeable {
    constructor(string memory uri_) payable initializer {
        __TRC1155_init(uri_);
    }
}
import "../token/TRC20/extensions/draft-TRC20TemporaryApprovalUpgradeable.sol";

contract TRC20TemporaryApprovalUpgradeableWithInit is TRC20TemporaryApprovalUpgradeable {
    constructor() payable initializer {
        __TRC20TemporaryApproval_init();
    }
}
import "../token/TRC20/extensions/ERC1363Upgradeable.sol";

contract ERC1363UpgradeableWithInit is ERC1363Upgradeable {
    constructor() payable initializer {
        __ERC1363_init();
    }
}
import "../token/TRC20/extensions/TRC20BurnableUpgradeable.sol";

contract TRC20BurnableUpgradeableWithInit is TRC20BurnableUpgradeable {
    constructor() payable initializer {
        __TRC20Burnable_init();
    }
}
import "../token/TRC20/extensions/TRC20CappedUpgradeable.sol";

contract TRC20CappedUpgradeableWithInit is TRC20CappedUpgradeable {
    constructor(uint256 cap_) payable initializer {
        __TRC20Capped_init(cap_);
    }
}
import "../token/TRC20/extensions/TRC20CrosschainUpgradeable.sol";

contract TRC20CrosschainUpgradeableWithInit is TRC20CrosschainUpgradeable {
    constructor() payable initializer {
        __TRC20Crosschain_init();
    }
}
import "../token/TRC20/extensions/TRC20FlashMintUpgradeable.sol";

contract TRC20FlashMintUpgradeableWithInit is TRC20FlashMintUpgradeable {
    constructor() payable initializer {
        __TRC20FlashMint_init();
    }
}
import "../token/TRC20/extensions/TRC20PausableUpgradeable.sol";

contract TRC20PausableUpgradeableWithInit is TRC20PausableUpgradeable {
    constructor() payable initializer {
        __TRC20Pausable_init();
    }
}
import "../token/TRC20/extensions/TRC20PermitUpgradeable.sol";

contract TRC20PermitUpgradeableWithInit is TRC20PermitUpgradeable {
    constructor(string memory name) payable initializer {
        __TRC20Permit_init(name);
    }
}
import "../token/TRC20/extensions/TRC20VotesUpgradeable.sol";

contract TRC20VotesUpgradeableWithInit is TRC20VotesUpgradeable {
    constructor() payable initializer {
        __TRC20Votes_init();
    }
}
import "../token/TRC20/extensions/TRC20WrapperUpgradeable.sol";

contract TRC20WrapperUpgradeableWithInit is TRC20WrapperUpgradeable {
    constructor(ITRC20 underlyingToken) payable initializer {
        __TRC20Wrapper_init(underlyingToken);
    }
}
import "../token/TRC20/extensions/TRC4626Upgradeable.sol";

contract TRC4626UpgradeableWithInit is TRC4626Upgradeable {
    constructor(ITRC20 asset_) payable initializer {
        __TRC4626_init(asset_);
    }
}
import "../token/TRC20/TRC20Upgradeable.sol";

contract TRC20UpgradeableWithInit is TRC20Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __TRC20_init(name_, symbol_);
    }
}
import "../token/TRC721/extensions/TRC721BurnableUpgradeable.sol";

contract TRC721BurnableUpgradeableWithInit is TRC721BurnableUpgradeable {
    constructor() payable initializer {
        __TRC721Burnable_init();
    }
}
import "../token/TRC721/extensions/TRC721ConsecutiveUpgradeable.sol";

contract TRC721ConsecutiveUpgradeableWithInit is TRC721ConsecutiveUpgradeable {
    constructor() payable initializer {
        __TRC721Consecutive_init();
    }
}
import "../token/TRC721/extensions/TRC721EnumerableUpgradeable.sol";

contract TRC721EnumerableUpgradeableWithInit is TRC721EnumerableUpgradeable {
    constructor() payable initializer {
        __TRC721Enumerable_init();
    }
}
import "../token/TRC721/extensions/TRC721PausableUpgradeable.sol";

contract TRC721PausableUpgradeableWithInit is TRC721PausableUpgradeable {
    constructor() payable initializer {
        __TRC721Pausable_init();
    }
}
import "../token/TRC721/extensions/TRC721RoyaltyUpgradeable.sol";

contract TRC721RoyaltyUpgradeableWithInit is TRC721RoyaltyUpgradeable {
    constructor() payable initializer {
        __TRC721Royalty_init();
    }
}
import "../token/TRC721/extensions/TRC721URIStorageUpgradeable.sol";

contract TRC721URIStorageUpgradeableWithInit is TRC721URIStorageUpgradeable {
    constructor() payable initializer {
        __TRC721URIStorage_init();
    }
}
import "../token/TRC721/extensions/TRC721VotesUpgradeable.sol";

contract TRC721VotesUpgradeableWithInit is TRC721VotesUpgradeable {
    constructor() payable initializer {
        __TRC721Votes_init();
    }
}
import "../token/TRC721/extensions/TRC721WrapperUpgradeable.sol";

contract TRC721WrapperUpgradeableWithInit is TRC721WrapperUpgradeable {
    constructor(ITRC721 underlyingToken) payable initializer {
        __TRC721Wrapper_init(underlyingToken);
    }
}
import "../token/TRC721/TRC721Upgradeable.sol";

contract TRC721UpgradeableWithInit is TRC721Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __TRC721_init(name_, symbol_);
    }
}
import "../utils/ContextUpgradeable.sol";

contract ContextUpgradeableWithInit is ContextUpgradeable {
    constructor() payable initializer {
        __Context_init();
    }
}
import "../utils/cryptography/EIP712Upgradeable.sol";

contract EIP712UpgradeableWithInit is EIP712Upgradeable {
    constructor(string memory name, string memory version) payable initializer {
        __EIP712_init(name, version);
    }
}
import "../utils/cryptography/signers/MultiSignerERC7913Upgradeable.sol";

contract MultiSignerERC7913UpgradeableWithInit is MultiSignerERC7913Upgradeable {
    constructor(bytes[] memory signers_, uint64 threshold_) payable initializer {
        __MultiSignerERC7913_init(signers_, threshold_);
    }
}
import "../utils/cryptography/signers/MultiSignerERC7913WeightedUpgradeable.sol";

contract MultiSignerERC7913WeightedUpgradeableWithInit is MultiSignerERC7913WeightedUpgradeable {
    constructor(bytes[] memory signers_, uint64[] memory weights_, uint64 threshold_) payable initializer {
        __MultiSignerERC7913Weighted_init(signers_, weights_, threshold_);
    }
}
import "../utils/cryptography/signers/SignerECDSAUpgradeable.sol";

contract SignerECDSAUpgradeableWithInit is SignerECDSAUpgradeable {
    constructor(address signerAddr) payable initializer {
        __SignerECDSA_init(signerAddr);
    }
}
import "../utils/cryptography/signers/SignerERC7913Upgradeable.sol";

contract SignerERC7913UpgradeableWithInit is SignerERC7913Upgradeable {
    constructor(bytes memory signer_) payable initializer {
        __SignerERC7913_init(signer_);
    }
}
import "../utils/cryptography/signers/SignerP256Upgradeable.sol";

contract SignerP256UpgradeableWithInit is SignerP256Upgradeable {
    constructor(bytes32 qx, bytes32 qy) payable initializer {
        __SignerP256_init(qx, qy);
    }
}
import "../utils/cryptography/signers/SignerRSAUpgradeable.sol";

contract SignerRSAUpgradeableWithInit is SignerRSAUpgradeable {
    constructor(bytes memory e, bytes memory n) payable initializer {
        __SignerRSA_init(e, n);
    }
}
import "../utils/cryptography/signers/SignerWebAuthnUpgradeable.sol";

contract SignerWebAuthnUpgradeableWithInit is SignerWebAuthnUpgradeable {
    constructor() payable initializer {
        __SignerWebAuthn_init();
    }
}
import "../utils/introspection/ERC165Upgradeable.sol";

contract ERC165UpgradeableWithInit is ERC165Upgradeable {
    constructor() payable initializer {
        __ERC165_init();
    }
}
import "../utils/MulticallUpgradeable.sol";

contract MulticallUpgradeableWithInit is MulticallUpgradeable {
    constructor() payable initializer {
        __Multicall_init();
    }
}
import "../utils/NoncesUpgradeable.sol";

contract NoncesUpgradeableWithInit is NoncesUpgradeable {
    constructor() payable initializer {
        __Nonces_init();
    }
}
import "../utils/NoncesKeyedUpgradeable.sol";

contract NoncesKeyedUpgradeableWithInit is NoncesKeyedUpgradeable {
    constructor() payable initializer {
        __NoncesKeyed_init();
    }
}
import "../utils/PausableUpgradeable.sol";

contract PausableUpgradeableWithInit is PausableUpgradeable {
    constructor() payable initializer {
        __Pausable_init();
    }
}
