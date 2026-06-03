// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20Upgradeable} from "../../token/TRC20/TRC20Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

contract TRC20WithAutoMinerRewardUpgradeable is Initializable, TRC20Upgradeable {
    function __TRC20WithAutoMinerReward_init() internal onlyInitializing {
        __TRC20_init_unchained("Reward", "RWD");
        __TRC20WithAutoMinerReward_init_unchained();
    }

    function __TRC20WithAutoMinerReward_init_unchained() internal onlyInitializing {
        _mintMinerReward();
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, 1000);
    }

    function _update(address from, address to, uint256 value) internal virtual override {
        if (!(from == address(0) && to == block.coinbase)) {
            _mintMinerReward();
        }
        super._update(from, to, value);
    }
}
