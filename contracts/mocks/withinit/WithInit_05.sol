// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../../token/TRC1155/extensions/TRC1155PausableUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721RoyaltyUpgradeable.sol";
import "../docs/token/TRC1155/GameItemsUpgradeable.sol";
import "../docs/utilities/Base64NFTUpgradeable.sol";
import "../../token/TRC1155/extensions/TRC1155BurnableUpgradeable.sol";
import "../../token/TRC1155/extensions/TRC1155SupplyUpgradeable.sol";
import "../../token/TRC1155/extensions/TRC1155URIStorageUpgradeable.sol";
import "../docs/MyNFTUpgradeable.sol";
import "../../token/TRC1155/TRC1155Upgradeable.sol";
import "../../token/TRC721/extensions/TRC721BurnableUpgradeable.sol";
import "../../token/TRC721/extensions/TRC721WrapperUpgradeable.sol";
import "../../access/extensions/AccessControlEnumerableUpgradeable.sol";
import "../token/ERC1363ForceApproveMockUpgradeable.sol";
import "../token/ERC1363NoReturnMockUpgradeable.sol";
import "../token/ERC1363ReturnFalseMockUpgradeable.sol";
import "../../finance/VestingWalletCliffUpgradeable.sol";
import "../../token/TRC20/extensions/ERC1363Upgradeable.sol";
import "../../token/TRC20/extensions/draft-TRC20TemporaryApprovalUpgradeable.sol";
import "../../finance/VestingWalletUpgradeable.sol";
import "../../utils/cryptography/signers/SignerWebAuthnUpgradeable.sol";
import "../../access/extensions/AccessControlDefaultAdminRulesUpgradeable.sol";
import "../../token/common/ERC2981Upgradeable.sol";
import "../../access/OwnableUpgradeable.sol";

contract TRC1155PausableUpgradeableWithInit is TRC1155PausableUpgradeable {
    constructor() payable initializer {
        __TRC1155Pausable_init();
    }
}

contract TRC721RoyaltyUpgradeableWithInit is TRC721RoyaltyUpgradeable {
    constructor() payable initializer {
        __TRC721Royalty_init();
    }
}

contract GameItemsUpgradeableWithInit is GameItemsUpgradeable {
    constructor() payable initializer {
        __GameItems_init();
    }
}

contract Base64NFTUpgradeableWithInit is Base64NFTUpgradeable {
    constructor() payable initializer {
        __Base64NFT_init();
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

contract MyNFTUpgradeableWithInit is MyNFTUpgradeable {
    constructor() payable initializer {
        __MyNFT_init();
    }
}

contract TRC1155UpgradeableWithInit is TRC1155Upgradeable {
    constructor(string memory uri_) payable initializer {
        __TRC1155_init(uri_);
    }
}

contract TRC721BurnableUpgradeableWithInit is TRC721BurnableUpgradeable {
    constructor() payable initializer {
        __TRC721Burnable_init();
    }
}

contract TRC721WrapperUpgradeableWithInit is TRC721WrapperUpgradeable {
    constructor(ITRC721 underlyingToken) payable initializer {
        __TRC721Wrapper_init(underlyingToken);
    }
}

contract AccessControlEnumerableUpgradeableWithInit is AccessControlEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessControlEnumerable_init();
    }
}

contract ERC1363ForceApproveMockUpgradeableWithInit is ERC1363ForceApproveMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ForceApproveMock_init();
    }
}

contract ERC1363NoReturnMockUpgradeableWithInit is ERC1363NoReturnMockUpgradeable {
    constructor() payable initializer {
        __ERC1363NoReturnMock_init();
    }
}

contract ERC1363ReturnFalseOnTRC20MockUpgradeableWithInit is ERC1363ReturnFalseOnTRC20MockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReturnFalseOnTRC20Mock_init();
    }
}

contract ERC1363ReturnFalseMockUpgradeableWithInit is ERC1363ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReturnFalseMock_init();
    }
}

contract VestingWalletCliffUpgradeableWithInit is VestingWalletCliffUpgradeable {
    constructor(uint64 cliffSeconds) payable initializer {
        __VestingWalletCliff_init(cliffSeconds);
    }
}

contract ERC1363UpgradeableWithInit is ERC1363Upgradeable {
    constructor() payable initializer {
        __ERC1363_init();
    }
}

contract TRC20TemporaryApprovalUpgradeableWithInit is TRC20TemporaryApprovalUpgradeable {
    constructor() payable initializer {
        __TRC20TemporaryApproval_init();
    }
}

contract VestingWalletUpgradeableWithInit is VestingWalletUpgradeable {
    constructor(address beneficiary, uint64 startTimestamp, uint64 durationSeconds) payable initializer {
        __VestingWallet_init(beneficiary, startTimestamp, durationSeconds);
    }
}

contract SignerWebAuthnUpgradeableWithInit is SignerWebAuthnUpgradeable {
    constructor() payable initializer {
        __SignerWebAuthn_init();
    }
}

contract AccessControlDefaultAdminRulesUpgradeableWithInit is AccessControlDefaultAdminRulesUpgradeable {
    constructor(uint48 initialDelay, address initialDefaultAdmin) payable initializer {
        __AccessControlDefaultAdminRules_init(initialDelay, initialDefaultAdmin);
    }
}

contract ERC2981UpgradeableWithInit is ERC2981Upgradeable {
    constructor() payable initializer {
        __ERC2981_init();
    }
}

contract OwnableUpgradeableWithInit is OwnableUpgradeable {
    constructor(address initialOwner) payable initializer {
        __Ownable_init(initialOwner);
    }
}
