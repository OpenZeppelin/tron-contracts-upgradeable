// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../CallReceiverMockUpgradeable.sol";
import "../compound/CompTimelockUpgradeable.sol";
import "../ConstructorMockUpgradeable.sol";
import "../EtherReceiverMockUpgradeable.sol";
import "../proxy/BadBeaconUpgradeable.sol";
import "../proxy/ClashingImplementationUpgradeable.sol";
import "../token/TRC20ExcessDecimalsMockUpgradeable.sol";

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
