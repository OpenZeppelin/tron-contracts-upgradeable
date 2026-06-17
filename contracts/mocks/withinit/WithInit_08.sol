// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../TRC165MockUpgradeable.sol";
import "../CallReceiverMockUpgradeable.sol";
import "../compound/CompTimelockUpgradeable.sol";
import "../ConstructorMockUpgradeable.sol";
import "../EtherReceiverMockUpgradeable.sol";
import "../proxy/BadBeaconUpgradeable.sol";
import "../proxy/ClashingImplementationUpgradeable.sol";
import "../token/TRC20ExcessDecimalsMockUpgradeable.sol";

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

contract EtherReceiverMockUpgradeableWithInit is EtherReceiverMockUpgradeable {
    constructor() payable initializer {
        __EtherReceiverMock_init();
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

contract TRC20ExcessDecimalsMockUpgradeableWithInit is TRC20ExcessDecimalsMockUpgradeable {
    constructor() payable initializer {
        __TRC20ExcessDecimalsMock_init();
    }
}
