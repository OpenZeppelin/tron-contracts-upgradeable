// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../governance/GovernorVoteMockUpgradeable.sol";
import "../governance/GovernorWithParamsMockUpgradeable.sol";
import "../token/TRC721ConsecutiveMockUpgradeable.sol";
import "../docs/governance/MyTokenWrappedUpgradeable.sol";
import "../token/TRC20VotesTimestampMockUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721VotesUpgradeable.sol";
import "../docs/governance/MyTokenUpgradeable.sol";
import "../docs/governance/MyTokenTimestampBasedUpgradeable.sol";
import "../token/TRC20VotesAdditionalCheckpointsMockUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20VotesUpgradeable.sol";
import "../token/TRC721ConsecutiveEnumerableMockUpgradeable.sol";
import "../docs/token/TRC721/GameItemUpgradeable.sol";
import "../token/TRC20VotesLegacyMockUpgradeable.sol";
import "../token/TRC721URIStorageMockUpgradeable.sol";
import "../VotesExtendedMockUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721ConsecutiveUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721URIStorageUpgradeable.sol";
import "../../token/TRC20/extensions/TRC20PermitUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721EnumerableUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721PausableUpgradeable.sol";
import "../../token/TRC721/TRC721Upgradeable.sol";
import "../../token/TRC20/extensions/TRC20WrapperUpgradeable.sol";
import "../../token/TRC20/TRC20Upgradeable.sol";
import "../../utils/PausableUpgradeable.sol";

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

contract TRC721ConsecutiveNoConstructorMintMockUpgradeableWithInit is TRC721ConsecutiveNoConstructorMintMockUpgradeable {
    constructor(string memory name, string memory symbol) payable initializer {
        __TRC721ConsecutiveNoConstructorMintMock_init(name, symbol);
    }
}

contract MyTokenWrappedUpgradeableWithInit is MyTokenWrappedUpgradeable {
    constructor(
        ITRC20 wrappedToken
    ) payable initializer {
        __MyTokenWrapped_init(wrappedToken);
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

contract TRC721VotesUpgradeableWithInit is TRC721VotesUpgradeable {
    constructor() payable initializer {
        __TRC721Votes_init();
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

contract TRC20VotesUpgradeableWithInit is TRC20VotesUpgradeable {
    constructor() payable initializer {
        __TRC20Votes_init();
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

contract GameItemUpgradeableWithInit is GameItemUpgradeable {
    constructor() payable initializer {
        __GameItem_init();
    }
}

contract TRC20VotesLegacyMockUpgradeableWithInit is TRC20VotesLegacyMockUpgradeable {
    constructor() payable initializer {
        __TRC20VotesLegacyMock_init();
    }
}

contract TRC721URIStorageMockUpgradeableWithInit is TRC721URIStorageMockUpgradeable {
    constructor() payable initializer {
        __TRC721URIStorageMock_init();
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

contract TRC721ConsecutiveUpgradeableWithInit is TRC721ConsecutiveUpgradeable {
    constructor() payable initializer {
        __TRC721Consecutive_init();
    }
}

contract TRC721URIStorageUpgradeableWithInit is TRC721URIStorageUpgradeable {
    constructor() payable initializer {
        __TRC721URIStorage_init();
    }
}

contract TRC20PermitUpgradeableWithInit is TRC20PermitUpgradeable {
    constructor(string memory name) payable initializer {
        __TRC20Permit_init(name);
    }
}

contract TRC721EnumerableUpgradeableWithInit is TRC721EnumerableUpgradeable {
    constructor() payable initializer {
        __TRC721Enumerable_init();
    }
}

contract TRC721PausableUpgradeableWithInit is TRC721PausableUpgradeable {
    constructor() payable initializer {
        __TRC721Pausable_init();
    }
}

contract TRC721UpgradeableWithInit is TRC721Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __TRC721_init(name_, symbol_);
    }
}

contract TRC20WrapperUpgradeableWithInit is TRC20WrapperUpgradeable {
    constructor(ITRC20 underlyingToken) payable initializer {
        __TRC20Wrapper_init(underlyingToken);
    }
}

contract TRC20UpgradeableWithInit is TRC20Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __TRC20_init(name_, symbol_);
    }
}

contract PausableUpgradeableWithInit is PausableUpgradeable {
    constructor() payable initializer {
        __Pausable_init();
    }
}
