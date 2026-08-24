// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {TRC20VotesUpgradeable} from "../../token/TRC20/extensions/TRC20VotesUpgradeable.sol";
import {VotesExtendedUpgradeable, VotesUpgradeable} from "../../governance/utils/VotesExtendedUpgradeable.sol";
import {SafeCast} from "@openzeppelin/tron-contracts/utils/math/SafeCast.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

abstract contract TRC20VotesExtendedMockUpgradeable is Initializable, TRC20VotesUpgradeable, VotesExtendedUpgradeable {
    function __TRC20VotesExtendedMock_init() internal onlyInitializing {}

    function __TRC20VotesExtendedMock_init_unchained() internal onlyInitializing {}
    function _delegate(
        address account,
        address delegatee
    ) internal virtual override(VotesUpgradeable, VotesExtendedUpgradeable) {
        return super._delegate(account, delegatee);
    }

    function _transferVotingUnits(
        address from,
        address to,
        uint256 amount
    ) internal virtual override(VotesUpgradeable, VotesExtendedUpgradeable) {
        return super._transferVotingUnits(from, to, amount);
    }
}

abstract contract TRC20VotesExtendedTimestampMockUpgradeable is Initializable, TRC20VotesExtendedMockUpgradeable {
    function __TRC20VotesExtendedTimestampMock_init() internal onlyInitializing {}

    function __TRC20VotesExtendedTimestampMock_init_unchained() internal onlyInitializing {}
    function clock() public view virtual override returns (uint48) {
        return SafeCast.toUint48(block.timestamp);
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view virtual override returns (string memory) {
        return "mode=timestamp";
    }
}
