// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../governance/GovernorStorageMockUpgradeable.sol";
import "../governance/GovernorSuperQuorumMockUpgradeable.sol";
import "../governance/GovernorTimelockControlMockUpgradeable.sol";
import "../docs/governance/MyGovernorUpgradeable.sol";
import "../governance/GovernorCountingOverridableMockUpgradeable.sol";
import "../governance/GovernorNoncesKeyedMockUpgradeable.sol";
import "../governance/GovernorVotesSuperQuorumFractionMockUpgradeable.sol";
import "../governance/GovernorFractionalMockUpgradeable.sol";
import "../governance/GovernorProposalGuardianMockUpgradeable.sol";
import "../governance/GovernorSequentialProposalIdMockUpgradeable.sol";
import "../governance/GovernorTimelockAccessMockUpgradeable.sol";
import "../governance/GovernorTimelockCompoundMockUpgradeable.sol";
import "../token/TRC721ConsecutiveMockUpgradeable.sol";
import "../governance/GovernorMockUpgradeable.sol";
import "../governance/GovernorPreventLateQuorumMockUpgradeable.sol";
import "../token/TRC20VotesTimestampMockUpgradeable.sol";
import "../docs/governance/MyTokenWrappedUpgradeable.sol";
import "../docs/governance/MyTokenUpgradeable.sol";
import "../docs/governance/MyTokenTimestampBasedUpgradeable.sol";
import "../governance/GovernorVoteMockUpgradeable.sol";
import "../governance/GovernorWithParamsMockUpgradeable.sol";
import "../token/TRC20VotesAdditionalCheckpointsMockUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721VotesUpgradeable.sol";
import "../token/TRC20VotesLegacyMockUpgradeable.sol";
import "../token/TRC721ConsecutiveEnumerableMockUpgradeable.sol";
import "../utils/cryptography/TRC7739MockUpgradeable.sol";
import "../VotesExtendedMockUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20VotesUpgradeable.sol";
import "../../metatx/TRC2771ForwarderUpgradeable.sol";
import "../docs/access-control/AccessControlTRC20MintBaseUpgradeable.sol";
import "../docs/access-control/AccessControlTRC20MintMissingUpgradeable.sol";
import "../docs/access-control/AccessControlTRC20MintOnlyRoleUpgradeable.sol";
import "../docs/token/TRC6909/TRC6909GameItemsUpgradeable.sol";
import "../VotesMockUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20PermitUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721PausableUpgradeable.sol";
import "../../governance/TimelockControllerUpgradeable.sol";
import "../../token/TRC6909/extensions/TRC6909MetadataUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721ConsecutiveUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721EnumerableUpgradeable.sol";
import "../../access/AccessControlUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20WrapperUpgradeable.sol";
import "../../token/TRC6909/TRC6909Upgradeable.sol";
import "../../token/TRC721/TRC721Upgradeable.sol";
import "../../metatx/TRC2771ContextUpgradeable.sol";
import "../../token/TRC20/TRC20Upgradeable.sol";
import "../../utils/NoncesKeyedUpgradeable.sol";
import "../../utils/PausableUpgradeable.sol";
import "../../utils/ContextUpgradeable.sol";
import "../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import "../../utils/cryptography/signers/SignerP256Upgradeable.sol";
import "../../utils/cryptography/signers/SignerRSAUpgradeable.sol";
import "../../utils/cryptography/TIP712Upgradeable.sol";
import "../../utils/introspection/TRC165Upgradeable.sol";
import "../../utils/NoncesUpgradeable.sol";

contract GovernorStorageMockUpgradeableWithInit is GovernorStorageMockUpgradeable {
    constructor() payable initializer {
        __GovernorStorageMock_init();
    }
}

contract GovernorSuperQuorumMockUpgradeableWithInit is GovernorSuperQuorumMockUpgradeable {
    constructor(uint256 quorum_, uint256 superQuorum_) payable initializer {
        __GovernorSuperQuorumMock_init(quorum_, superQuorum_);
    }
}

contract GovernorTimelockControlMockUpgradeableWithInit is GovernorTimelockControlMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockControlMock_init();
    }
}

contract MyGovernorUpgradeableWithInit is MyGovernorUpgradeable {
    constructor(IVotes _token, TimelockControllerUpgradeable _timelock) payable initializer {
        __MyGovernor_init(_token, _timelock);
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

contract GovernorTimelockAccessMockUpgradeableWithInit is GovernorTimelockAccessMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockAccessMock_init();
    }
}

contract GovernorTimelockCompoundMockUpgradeableWithInit is GovernorTimelockCompoundMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockCompoundMock_init();
    }
}

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

contract TRC721ConsecutiveNoConstructorMintMockUpgradeableWithInit is
    TRC721ConsecutiveNoConstructorMintMockUpgradeable
{
    constructor(string memory name, string memory symbol) payable initializer {
        __TRC721ConsecutiveNoConstructorMintMock_init(name, symbol);
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

contract TRC20VotesTimestampMockUpgradeableWithInit is TRC20VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesTimestampMock_init();
    }
}

contract TRC721VotesTimestampMockUpgradeableWithInit is TRC721VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __TRC721VotesTimestampMock_init();
    }
}

contract MyTokenWrappedUpgradeableWithInit is MyTokenWrappedUpgradeable {
    constructor(ITRC20 wrappedToken) payable initializer {
        __MyTokenWrapped_init(wrappedToken);
    }
}

contract MyTokenUpgradeableWithInit is MyTokenUpgradeable {
    constructor() payable initializer {
        __MyToken_init();
    }
}

contract MyTokenTimestampBasedUpgradeableWithInit is MyTokenTimestampBasedUpgradeable {
    constructor() payable initializer {
        __MyTokenTimestampBased_init();
    }
}

contract GovernorVoteMocksUpgradeableWithInit is GovernorVoteMocksUpgradeable {
    constructor() payable initializer {
        __GovernorVoteMocks_init();
    }
}

contract GovernorWithParamsMockUpgradeableWithInit is GovernorWithParamsMockUpgradeable {
    constructor() payable initializer {
        __GovernorWithParamsMock_init();
    }
}

contract TRC20VotesExtendedMockUpgradeableWithInit is TRC20VotesExtendedMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesExtendedMock_init();
    }
}

contract TRC20VotesExtendedTimestampMockUpgradeableWithInit is TRC20VotesExtendedTimestampMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesExtendedTimestampMock_init();
    }
}

contract TRC721VotesUpgradeableWithInit is TRC721VotesUpgradeable {
    constructor() payable initializer {
        __TRC721Votes_init();
    }
}

contract TRC20VotesLegacyMockUpgradeableWithInit is TRC20VotesLegacyMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesLegacyMock_init();
    }
}

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

contract VotesExtendedMockUpgradeableWithInit is VotesExtendedMockUpgradeable {
    constructor() payable initializer {
        __VotesExtendedMock_init();
    }
}

contract VotesExtendedTimestampMockUpgradeableWithInit is VotesExtendedTimestampMockUpgradeable {
    constructor() payable initializer {
        __VotesExtendedTimestampMock_init();
    }
}

contract TRC20VotesUpgradeableWithInit is TRC20VotesUpgradeable {
    constructor() payable initializer {
        __TRC20Votes_init();
    }
}

contract TRC2771ForwarderUpgradeableWithInit is TRC2771ForwarderUpgradeable {
    constructor(string memory name) payable initializer {
        __TRC2771Forwarder_init(name);
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

contract TRC6909GameItemsUpgradeableWithInit is TRC6909GameItemsUpgradeable {
    constructor() payable initializer {
        __TRC6909GameItems_init();
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

contract TRC20PermitUpgradeableWithInit is TRC20PermitUpgradeable {
    constructor(string memory name) payable initializer {
        __TRC20Permit_init(name);
    }
}

contract TRC721PausableUpgradeableWithInit is TRC721PausableUpgradeable {
    constructor() payable initializer {
        __TRC721Pausable_init();
    }
}

contract TimelockControllerUpgradeableWithInit is TimelockControllerUpgradeable {
    constructor(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors,
        address admin
    ) payable initializer {
        __TimelockController_init(minDelay, proposers, executors, admin);
    }
}

contract TRC6909MetadataUpgradeableWithInit is TRC6909MetadataUpgradeable {
    constructor() payable initializer {
        __TRC6909Metadata_init();
    }
}

contract TRC721ConsecutiveUpgradeableWithInit is TRC721ConsecutiveUpgradeable {
    constructor() payable initializer {
        __TRC721Consecutive_init();
    }
}

contract TRC721EnumerableUpgradeableWithInit is TRC721EnumerableUpgradeable {
    constructor() payable initializer {
        __TRC721Enumerable_init();
    }
}

contract AccessControlUpgradeableWithInit is AccessControlUpgradeable {
    constructor() payable initializer {
        __AccessControl_init();
    }
}

contract TRC20WrapperUpgradeableWithInit is TRC20WrapperUpgradeable {
    constructor(ITRC20 underlyingToken) payable initializer {
        __TRC20Wrapper_init(underlyingToken);
    }
}

contract TRC6909UpgradeableWithInit is TRC6909Upgradeable {
    constructor() payable initializer {
        __TRC6909_init();
    }
}

contract TRC721UpgradeableWithInit is TRC721Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __TRC721_init(name_, symbol_);
    }
}

contract TRC2771ContextUpgradeableWithInit is TRC2771ContextUpgradeable {
    constructor(address trustedForwarder_) payable TRC2771ContextUpgradeable(trustedForwarder_) initializer {}
}

contract TRC20UpgradeableWithInit is TRC20Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __TRC20_init(name_, symbol_);
    }
}

contract NoncesKeyedUpgradeableWithInit is NoncesKeyedUpgradeable {
    constructor() payable initializer {
        __NoncesKeyed_init();
    }
}

contract PausableUpgradeableWithInit is PausableUpgradeable {
    constructor() payable initializer {
        __Pausable_init();
    }
}

contract ContextUpgradeableWithInit is ContextUpgradeable {
    constructor() payable initializer {
        __Context_init();
    }
}

contract SignerECDSAUpgradeableWithInit is SignerECDSAUpgradeable {
    constructor(address signerAddr) payable initializer {
        __SignerECDSA_init(signerAddr);
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

contract TIP712UpgradeableWithInit is TIP712Upgradeable {
    constructor(string memory name, string memory version) payable initializer {
        __TIP712_init(name, version);
    }
}

contract TRC165UpgradeableWithInit is TRC165Upgradeable {
    constructor() payable initializer {
        __TRC165_init();
    }
}

contract NoncesUpgradeableWithInit is NoncesUpgradeable {
    constructor() payable initializer {
        __Nonces_init();
    }
}
