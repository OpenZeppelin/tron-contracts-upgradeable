// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {TRC7739Upgradeable} from "../../../utils/cryptography/signers/draft-TRC7739Upgradeable.sol";
import {SignerECDSAUpgradeable} from "../../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import {SignerP256Upgradeable} from "../../../utils/cryptography/signers/SignerP256Upgradeable.sol";
import {SignerRSAUpgradeable} from "../../../utils/cryptography/signers/SignerRSAUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

abstract contract TRC7739ECDSAMockUpgradeable is Initializable, TRC7739Upgradeable, SignerECDSAUpgradeable {    function __TRC7739ECDSAMock_init() internal onlyInitializing {
    }

    function __TRC7739ECDSAMock_init_unchained() internal onlyInitializing {
    }
}
abstract contract TRC7739P256MockUpgradeable is Initializable, TRC7739Upgradeable, SignerP256Upgradeable {    function __TRC7739P256Mock_init() internal onlyInitializing {
    }

    function __TRC7739P256Mock_init_unchained() internal onlyInitializing {
    }
}
abstract contract TRC7739RSAMockUpgradeable is Initializable, TRC7739Upgradeable, SignerRSAUpgradeable {    function __TRC7739RSAMock_init() internal onlyInitializing {
    }

    function __TRC7739RSAMock_init_unchained() internal onlyInitializing {
    }
}
