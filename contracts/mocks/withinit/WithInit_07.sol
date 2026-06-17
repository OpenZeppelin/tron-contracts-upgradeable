// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../../token/TRC20/extensions/TRC20PausableUpgradeable.sol";
import "../docs/token/TRC20/GLDTokenUpgradeable.sol";
import "../docs/TRC20WithAutoMinerRewardUpgradeable.sol";
import "../docs/utilities/MulticallUpgradeable.sol";
import "../token/TRC20ApprovalMockUpgradeable.sol";
import "../token/TRC20DecimalsMockUpgradeable.sol";
import "../token/TRC20ForceApproveMockUpgradeable.sol";
import "../token/TRC20MockUpgradeable.sol";
import "../token/TRC20NoReturnMockUpgradeable.sol";
import "../token/TRC20ReturnFalseMockUpgradeable.sol";
import "../token/TRC20USDTMockUpgradeable.sol";
import "../TRC3156FlashBorrowerMockUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20BurnableUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20CappedUpgradeable.sol";
import "../../token/TRC6909/extensions/TRC6909ContentURIUpgradeable.sol";
import "../../token/TRC6909/extensions/TRC6909TokenSupplyUpgradeable.sol";
import "../docs/token/TRC1155/MyTRC1155HolderContractUpgradeable.sol";
import "../ReentrancyMockUpgradeable.sol";
import "../ReentrancyTransientMockUpgradeable.sol";
import "../TRC1271WalletMockUpgradeable.sol";
import "../BatchCallerUpgradeable.sol";
import "../TimelockReentrantUpgradeable.sol";
import "../token/TRC1155ReceiverMockUpgradeable.sol";
import "../../access/Ownable2StepUpgradeable.sol";
import "../AuthorityMockUpgradeable.sol";
import "../Base64DirtyUpgradeable.sol";
import "../crosschain/TRC7786RecipientMockUpgradeable.sol";
import "../docs/access-control/MyContractOwnableUpgradeable.sol";
import "../MerkleProofCustomHashMockUpgradeable.sol";
import "../PausableMockUpgradeable.sol";
import "../token/TRC20GetterHelperUpgradeable.sol";
import "../UpgradeableBeaconMockUpgradeable.sol";
import "../ReentrancyAttackUpgradeable.sol";
import "../token/TRC1363ReceiverMockUpgradeable.sol";
import "../token/TRC1363SpenderMockUpgradeable.sol";
import "../token/TRC721ReceiverMockUpgradeable.sol";

contract TRC20PausableUpgradeableWithInit is TRC20PausableUpgradeable {
    constructor() payable initializer {
        __TRC20Pausable_init();
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

contract TRC20ReturnFalseMockUpgradeableWithInit is TRC20ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __TRC20ReturnFalseMock_init();
    }
}

contract TRC20USDTMockUpgradeableWithInit is TRC20USDTMockUpgradeable {
    constructor() payable initializer {
        __TRC20USDTMock_init();
    }
}

contract TRC3156FlashBorrowerMockUpgradeableWithInit is TRC3156FlashBorrowerMockUpgradeable {
    constructor(bool enableReturn, bool enableApprove) payable initializer {
        __TRC3156FlashBorrowerMock_init(enableReturn, enableApprove);
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

contract MyTRC1155HolderContractUpgradeableWithInit is MyTRC1155HolderContractUpgradeable {
    constructor() payable initializer {
        __MyTRC1155HolderContract_init();
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

contract BatchCallerUpgradeableWithInit is BatchCallerUpgradeable {
    constructor() payable initializer {
        __BatchCaller_init();
    }
}

contract TimelockReentrantUpgradeableWithInit is TimelockReentrantUpgradeable {
    constructor() payable initializer {
        __TimelockReentrant_init();
    }
}

contract TRC1155ReceiverMockUpgradeableWithInit is TRC1155ReceiverMockUpgradeable {
    constructor(bytes4 recRetval, bytes4 batRetval, RevertType error) payable initializer {
        __TRC1155ReceiverMock_init(recRetval, batRetval, error);
    }
}

contract Ownable2StepUpgradeableWithInit is Ownable2StepUpgradeable {
    constructor() payable initializer {
        __Ownable2Step_init();
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

contract TRC7786RecipientMockUpgradeableWithInit is TRC7786RecipientMockUpgradeable {
    constructor(address gateway_) payable initializer {
        __TRC7786RecipientMock_init(gateway_);
    }
}

contract MyContractUpgradeableWithInit is MyContractUpgradeable {
    constructor(address initialOwner) payable initializer {
        __MyContract_init(initialOwner);
    }
}

contract MerkleProofCustomHashMockUpgradeableWithInit is MerkleProofCustomHashMockUpgradeable {
    constructor() payable initializer {
        __MerkleProofCustomHashMock_init();
    }
}

contract PausableMockUpgradeableWithInit is PausableMockUpgradeable {
    constructor() payable initializer {
        __PausableMock_init();
    }
}

contract TRC20GetterHelperUpgradeableWithInit is TRC20GetterHelperUpgradeable {
    constructor() payable initializer {
        __TRC20GetterHelper_init();
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

contract ReentrancyAttackUpgradeableWithInit is ReentrancyAttackUpgradeable {
    constructor() payable initializer {
        __ReentrancyAttack_init();
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

contract TRC721ReceiverMockUpgradeableWithInit is TRC721ReceiverMockUpgradeable {
    constructor(bytes4 retval, RevertType error) payable initializer {
        __TRC721ReceiverMock_init(retval, error);
    }
}
