// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20BridgeableUpgradeable} from "../../token/TRC20/extensions/draft-TRC20BridgeableUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract TRC20BridgeableMockUpgradeable is Initializable, TRC20BridgeableUpgradeable {
    address private _bridge;

    error OnlyTokenBridge();
    event OnlyTokenBridgeFnCalled(address caller);

    function __TRC20BridgeableMock_init(address initialBridge) internal onlyInitializing {
        __TRC20BridgeableMock_init_unchained(initialBridge);
    }

    function __TRC20BridgeableMock_init_unchained(address initialBridge) internal onlyInitializing {
        _setBridge(initialBridge);
    }

    function _setBridge(address bridge) internal {
        _bridge = bridge;
    }

    function onlyTokenBridgeFn() external onlyTokenBridge {
        emit OnlyTokenBridgeFnCalled(msg.sender);
    }

    function _checkTokenBridge(address sender) internal view override {
        if (sender != _bridge) {
            revert OnlyTokenBridge();
        }
    }
}
