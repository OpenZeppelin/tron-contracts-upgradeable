// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../governance/GovernorStorageMockUpgradeable.sol";
import "../governance/GovernorTimelockControlMockUpgradeable.sol";
import "../docs/governance/MyGovernorUpgradeable.sol";
import "../governance/GovernorSuperQuorumMockUpgradeable.sol";
import "../governance/GovernorTimelockAccessMockUpgradeable.sol";
import "../governance/GovernorCountingOverridableMockUpgradeable.sol";
import "../governance/GovernorNoncesKeyedMockUpgradeable.sol";
import "../governance/GovernorTimelockCompoundMockUpgradeable.sol";
import "../governance/GovernorVotesSuperQuorumFractionMockUpgradeable.sol";
import "../governance/GovernorFractionalMockUpgradeable.sol";
import "../governance/GovernorProposalGuardianMockUpgradeable.sol";
import "../governance/GovernorSequentialProposalIdMockUpgradeable.sol";
import "../governance/GovernorMockUpgradeable.sol";
import "../governance/GovernorPreventLateQuorumMockUpgradeable.sol";
import "../../governance/TimelockControllerUpgradeable.sol";
import "../../utils/cryptography/EIP712Upgradeable.sol";
import "../../access/AccessControlUpgradeable.sol";
import "../../utils/ContextUpgradeable.sol";

contract GovernorStorageMockUpgradeableWithInit is GovernorStorageMockUpgradeable {
    constructor() payable initializer {
        __GovernorStorageMock_init();
    }
}

contract GovernorTimelockControlMockUpgradeableWithInit is GovernorTimelockControlMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockControlMock_init();
    }
}

contract MyGovernorUpgradeableWithInit is MyGovernorUpgradeable {
    constructor(
        IVotes _token,
        TimelockControllerUpgradeable _timelock
    ) payable initializer {
        __MyGovernor_init(_token, _timelock);
    }
}

contract GovernorSuperQuorumMockUpgradeableWithInit is GovernorSuperQuorumMockUpgradeable {
    constructor(uint256 quorum_, uint256 superQuorum_) payable initializer {
        __GovernorSuperQuorumMock_init(quorum_, superQuorum_);
    }
}

contract GovernorTimelockAccessMockUpgradeableWithInit is GovernorTimelockAccessMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockAccessMock_init();
    }
}

contract GovernorCountingOverridableMockUpgradeableWithInit is GovernorCountingOverridableMockUpgradeable {
    constructor() payable initializer {
        __GovernorCountingOverridableMock_init();
    }
}

contract GovernorNoncesKeyedMockUpgradeableWithInit is GovernorNoncesKeyedMockUpgradeable {
    constructor() payable initializer {
        __GovernorNoncesKeyedMock_init();
    }
}

contract GovernorTimelockCompoundMockUpgradeableWithInit is GovernorTimelockCompoundMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockCompoundMock_init();
    }
}

contract GovernorVotesSuperQuorumFractionMockUpgradeableWithInit is GovernorVotesSuperQuorumFractionMockUpgradeable {
    constructor() payable initializer {
        __GovernorVotesSuperQuorumFractionMock_init();
    }
}

contract GovernorFractionalMockUpgradeableWithInit is GovernorFractionalMockUpgradeable {
    constructor() payable initializer {
        __GovernorFractionalMock_init();
    }
}

contract GovernorProposalGuardianMockUpgradeableWithInit is GovernorProposalGuardianMockUpgradeable {
    constructor() payable initializer {
        __GovernorProposalGuardianMock_init();
    }
}

contract GovernorSequentialProposalIdMockUpgradeableWithInit is GovernorSequentialProposalIdMockUpgradeable {
    constructor() payable initializer {
        __GovernorSequentialProposalIdMock_init();
    }
}

contract GovernorMockUpgradeableWithInit is GovernorMockUpgradeable {
    constructor() payable initializer {
        __GovernorMock_init();
    }
}

contract GovernorPreventLateQuorumMockUpgradeableWithInit is GovernorPreventLateQuorumMockUpgradeable {
    constructor(uint256 quorum_) payable initializer {
        __GovernorPreventLateQuorumMock_init(quorum_);
    }
}

contract TimelockControllerUpgradeableWithInit is TimelockControllerUpgradeable {
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors, address admin) payable initializer {
        __TimelockController_init(minDelay, proposers, executors, admin);
    }
}

contract EIP712UpgradeableWithInit is EIP712Upgradeable {
    constructor(string memory name, string memory version) payable initializer {
        __EIP712_init(name, version);
    }
}

contract AccessControlUpgradeableWithInit is AccessControlUpgradeable {
    constructor() payable initializer {
        __AccessControl_init();
    }
}

contract ContextUpgradeableWithInit is ContextUpgradeable {
    constructor() payable initializer {
        __Context_init();
    }
}
