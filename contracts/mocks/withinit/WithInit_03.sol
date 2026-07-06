// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../token/TRC20ApprovalMockUpgradeable.sol";
import "../token/TRC20DecimalsMockUpgradeable.sol";
import "../token/TRC20ForceApproveMockUpgradeable.sol";
import "../token/TRC20MockUpgradeable.sol";
import "../token/TRC20NoReturnMockUpgradeable.sol";
import "../token/TRC20ReentrantUpgradeable.sol";
import "../token/TRC20ReturnFalseMockUpgradeable.sol";
import "../token/TRC20USDTFeeMockUpgradeable.sol";
import "../token/TRC20USDTMockUpgradeable.sol";
import "../TransientSlotMockUpgradeable.sol";
import "../TRC1271WalletMockUpgradeable.sol";
import "../../token/TRC20/extensions/draft-TRC20TemporaryApprovalUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20BurnableUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20CappedUpgradeable.sol";
import "../TIP712VerifierUpgradeable.sol";
import "../token/TRC1155ReceiverMockUpgradeable.sol";
import "../../utils/cryptography/signers/MultiSignerTRC7913WeightedUpgradeable.sol";
import "../../utils/cryptography/signers/SignerWebAuthnUpgradeable.sol";
import "../ArraysMockUpgradeable.sol";
import "../AuthorityMockUpgradeable.sol";
import "../Base64DirtyUpgradeable.sol";
import "../BatchCallerUpgradeable.sol";
import "../CallReceiverMockUpgradeable.sol";
import "../compound/CompTimelockUpgradeable.sol";
import "../ConstructorMockUpgradeable.sol";
import "../crosschain/TRC7786GatewayMockUpgradeable.sol";
import "../crosschain/TRC7786RecipientMockUpgradeable.sol";
import "../docs/token/TRC1155/MyTRC1155HolderContractUpgradeable.sol";
import "../DummyImplementationUpgradeable.sol";
import "../EtherReceiverMockUpgradeable.sol";
import "../MerkleProofCustomHashMockUpgradeable.sol";
import "../MerkleTreeMockUpgradeable.sol";
import "../proxy/BadBeaconUpgradeable.sol";
import "../proxy/ClashingImplementationUpgradeable.sol";
import "../proxy/UUPSUpgradeableMockUpgradeable.sol";
import "../TimelockReentrantUpgradeable.sol";
import "../token/TRC1363ReceiverMockUpgradeable.sol";
import "../token/TRC1363SpenderMockUpgradeable.sol";
import "../token/TRC20ExcessDecimalsMockUpgradeable.sol";
import "../token/TRC20GetterHelperUpgradeable.sol";
import "../token/TRC721ReceiverMockUpgradeable.sol";
import "../TRC165MockUpgradeable.sol";
import "../TRC3156FlashBorrowerMockUpgradeable.sol";
import "../UpgradeableBeaconMockUpgradeable.sol";
import "../../utils/cryptography/signers/MultiSignerTRC7913Upgradeable.sol";
import "../../utils/cryptography/signers/SignerTRC7913Upgradeable.sol";

contract TRC20ApprovalMockUpgradeableWithInit is TRC20ApprovalMockUpgradeable {
    constructor() payable initializer {
        __TRC20ApprovalMock_init();
    }
}

contract TRC20DecimalsMockUpgradeableWithInit is TRC20DecimalsMockUpgradeable {
    constructor(uint8 decimals_) payable initializer {
        __TRC20DecimalsMock_init(decimals_);
    }
}

contract TRC20ForceApproveMockUpgradeableWithInit is TRC20ForceApproveMockUpgradeable {
    constructor() payable initializer {
        __TRC20ForceApproveMock_init();
    }
}

contract TRC20MockUpgradeableWithInit is TRC20MockUpgradeable {
    constructor() payable initializer {
        __TRC20Mock_init();
    }
}

contract TRC20NoReturnMockUpgradeableWithInit is TRC20NoReturnMockUpgradeable {
    constructor() payable initializer {
        __TRC20NoReturnMock_init();
    }
}

contract TRC20ReentrantUpgradeableWithInit is TRC20ReentrantUpgradeable {
    constructor() payable initializer {
        __TRC20Reentrant_init();
    }
}

contract TRC20ReturnFalseMockUpgradeableWithInit is TRC20ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __TRC20ReturnFalseMock_init();
    }
}

contract TRC20USDTFeeMockUpgradeableWithInit is TRC20USDTFeeMockUpgradeable {
    constructor() payable initializer {
        __TRC20USDTFeeMock_init();
    }
}

contract TRC20USDTMockUpgradeableWithInit is TRC20USDTMockUpgradeable {
    constructor() payable initializer {
        __TRC20USDTMock_init();
    }
}

contract TransientSlotMockUpgradeableWithInit is TransientSlotMockUpgradeable {
    constructor() payable initializer {
        __TransientSlotMock_init();
    }
}

contract TRC1271WalletMockUpgradeableWithInit is TRC1271WalletMockUpgradeable {
    constructor(address originalOwner) payable initializer {
        __TRC1271WalletMock_init(originalOwner);
    }
}

contract TRC1271MaliciousMockUpgradeableWithInit is TRC1271MaliciousMockUpgradeable {
    constructor() payable initializer {
        __TRC1271MaliciousMock_init();
    }
}

contract TRC20TemporaryApprovalUpgradeableWithInit is TRC20TemporaryApprovalUpgradeable {
    constructor() payable initializer {
        __TRC20TemporaryApproval_init();
    }
}

contract TRC20BurnableUpgradeableWithInit is TRC20BurnableUpgradeable {
    constructor() payable initializer {
        __TRC20Burnable_init();
    }
}

contract TRC20CappedUpgradeableWithInit is TRC20CappedUpgradeable {
    constructor(uint256 cap_) payable initializer {
        __TRC20Capped_init(cap_);
    }
}

contract TIP712VerifierUpgradeableWithInit is TIP712VerifierUpgradeable {
    constructor() payable initializer {
        __TIP712Verifier_init();
    }
}

contract TRC1155ReceiverMockUpgradeableWithInit is TRC1155ReceiverMockUpgradeable {
    constructor(bytes4 recRetval, bytes4 batRetval, RevertType error) payable initializer {
        __TRC1155ReceiverMock_init(recRetval, batRetval, error);
    }
}

contract MultiSignerTRC7913WeightedUpgradeableWithInit is MultiSignerTRC7913WeightedUpgradeable {
    constructor(bytes[] memory signers_, uint64[] memory weights_, uint64 threshold_) payable initializer {
        __MultiSignerTRC7913Weighted_init(signers_, weights_, threshold_);
    }
}

contract SignerWebAuthnUpgradeableWithInit is SignerWebAuthnUpgradeable {
    constructor() payable initializer {
        __SignerWebAuthn_init();
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

contract NotAuthorityMockUpgradeableWithInit is NotAuthorityMockUpgradeable {
    constructor() payable initializer {
        __NotAuthorityMock_init();
    }
}

contract AuthorityNoDelayMockUpgradeableWithInit is AuthorityNoDelayMockUpgradeable {
    constructor() payable initializer {
        __AuthorityNoDelayMock_init();
    }
}

contract AuthorityDelayMockUpgradeableWithInit is AuthorityDelayMockUpgradeable {
    constructor() payable initializer {
        __AuthorityDelayMock_init();
    }
}

contract AuthorityNoResponseUpgradeableWithInit is AuthorityNoResponseUpgradeable {
    constructor() payable initializer {
        __AuthorityNoResponse_init();
    }
}

contract AuthorityObserveIsConsumingUpgradeableWithInit is AuthorityObserveIsConsumingUpgradeable {
    constructor() payable initializer {
        __AuthorityObserveIsConsuming_init();
    }
}

contract Base64DirtyUpgradeableWithInit is Base64DirtyUpgradeable {
    constructor() payable initializer {
        __Base64Dirty_init();
    }
}

contract BatchCallerUpgradeableWithInit is BatchCallerUpgradeable {
    constructor() payable initializer {
        __BatchCaller_init();
    }
}

contract CallReceiverMockUpgradeableWithInit is CallReceiverMockUpgradeable {
    constructor() payable initializer {
        __CallReceiverMock_init();
    }
}

contract CallReceiverMockTrustingForwarderUpgradeableWithInit is CallReceiverMockTrustingForwarderUpgradeable {
    constructor(address trustedForwarder_) payable initializer {
        __CallReceiverMockTrustingForwarder_init(trustedForwarder_);
    }
}

contract CompTimelockUpgradeableWithInit is CompTimelockUpgradeable {
    constructor(address admin_, uint256 delay_) payable initializer {
        __CompTimelock_init(admin_, delay_);
    }
}

contract ConstructorMockUpgradeableWithInit is ConstructorMockUpgradeable {
    constructor(RevertType error) payable initializer {
        __ConstructorMock_init(error);
    }
}

contract TRC7786GatewayMockUpgradeableWithInit is TRC7786GatewayMockUpgradeable {
    constructor() payable initializer {
        __TRC7786GatewayMock_init();
    }
}

contract TRC7786RecipientMockUpgradeableWithInit is TRC7786RecipientMockUpgradeable {
    constructor(address gateway_) payable initializer {
        __TRC7786RecipientMock_init(gateway_);
    }
}

contract MyTRC1155HolderContractUpgradeableWithInit is MyTRC1155HolderContractUpgradeable {
    constructor() payable initializer {
        __MyTRC1155HolderContract_init();
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

contract EtherReceiverMockUpgradeableWithInit is EtherReceiverMockUpgradeable {
    constructor() payable initializer {
        __EtherReceiverMock_init();
    }
}

contract MerkleProofCustomHashMockUpgradeableWithInit is MerkleProofCustomHashMockUpgradeable {
    constructor() payable initializer {
        __MerkleProofCustomHashMock_init();
    }
}

contract MerkleTreeMockUpgradeableWithInit is MerkleTreeMockUpgradeable {
    constructor() payable initializer {
        __MerkleTreeMock_init();
    }
}

contract BadBeaconNoImplUpgradeableWithInit is BadBeaconNoImplUpgradeable {
    constructor() payable initializer {
        __BadBeaconNoImpl_init();
    }
}

contract BadBeaconNotContractUpgradeableWithInit is BadBeaconNotContractUpgradeable {
    constructor() payable initializer {
        __BadBeaconNotContract_init();
    }
}

contract ClashingImplementationUpgradeableWithInit is ClashingImplementationUpgradeable {
    constructor() payable initializer {
        __ClashingImplementation_init();
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

contract TimelockReentrantUpgradeableWithInit is TimelockReentrantUpgradeable {
    constructor() payable initializer {
        __TimelockReentrant_init();
    }
}

contract TRC1363ReceiverMockUpgradeableWithInit is TRC1363ReceiverMockUpgradeable {
    constructor() payable initializer {
        __TRC1363ReceiverMock_init();
    }
}

contract TRC1363SpenderMockUpgradeableWithInit is TRC1363SpenderMockUpgradeable {
    constructor() payable initializer {
        __TRC1363SpenderMock_init();
    }
}

contract TRC20ExcessDecimalsMockUpgradeableWithInit is TRC20ExcessDecimalsMockUpgradeable {
    constructor() payable initializer {
        __TRC20ExcessDecimalsMock_init();
    }
}

contract TRC20GetterHelperUpgradeableWithInit is TRC20GetterHelperUpgradeable {
    constructor() payable initializer {
        __TRC20GetterHelper_init();
    }
}

contract TRC721ReceiverMockUpgradeableWithInit is TRC721ReceiverMockUpgradeable {
    constructor(bytes4 retval, RevertType error) payable initializer {
        __TRC721ReceiverMock_init(retval, error);
    }
}

contract SupportsInterfaceWithLookupMockUpgradeableWithInit is SupportsInterfaceWithLookupMockUpgradeable {
    constructor() payable initializer {
        __SupportsInterfaceWithLookupMock_init();
    }
}

contract TRC165InterfacesSupportedUpgradeableWithInit is TRC165InterfacesSupportedUpgradeable {
    constructor(bytes4[] memory interfaceIds) payable initializer {
        __TRC165InterfacesSupported_init(interfaceIds);
    }
}

contract TRC165RevertInvalidUpgradeableWithInit is TRC165RevertInvalidUpgradeable {
    constructor(bytes4[] memory interfaceIds) payable initializer {
        __TRC165RevertInvalid_init(interfaceIds);
    }
}

contract TRC165MaliciousDataUpgradeableWithInit is TRC165MaliciousDataUpgradeable {
    constructor() payable initializer {
        __TRC165MaliciousData_init();
    }
}

contract TRC165MissingDataUpgradeableWithInit is TRC165MissingDataUpgradeable {
    constructor() payable initializer {
        __TRC165MissingData_init();
    }
}

contract TRC165NotSupportedUpgradeableWithInit is TRC165NotSupportedUpgradeable {
    constructor() payable initializer {
        __TRC165NotSupported_init();
    }
}

contract TRC165ReturnBombMockUpgradeableWithInit is TRC165ReturnBombMockUpgradeable {
    constructor() payable initializer {
        __TRC165ReturnBombMock_init();
    }
}

contract TRC3156FlashBorrowerMockUpgradeableWithInit is TRC3156FlashBorrowerMockUpgradeable {
    constructor(bool enableReturn, bool enableApprove) payable initializer {
        __TRC3156FlashBorrowerMock_init(enableReturn, enableApprove);
    }
}

contract UpgradeableBeaconMockUpgradeableWithInit is UpgradeableBeaconMockUpgradeable {
    constructor(address impl) payable initializer {
        __UpgradeableBeaconMock_init(impl);
    }
}

contract UpgradeableBeaconReentrantMockUpgradeableWithInit is UpgradeableBeaconReentrantMockUpgradeable {
    constructor() payable initializer {
        __UpgradeableBeaconReentrantMock_init();
    }
}

contract MultiSignerTRC7913UpgradeableWithInit is MultiSignerTRC7913Upgradeable {
    constructor(bytes[] memory signers_, uint64 threshold_) payable initializer {
        __MultiSignerTRC7913_init(signers_, threshold_);
    }
}

contract SignerTRC7913UpgradeableWithInit is SignerTRC7913Upgradeable {
    constructor(bytes memory signer_) payable initializer {
        __SignerTRC7913_init(signer_);
    }
}
