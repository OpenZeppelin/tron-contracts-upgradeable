// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {TRC721VotesUpgradeable} from "../../token/TRC721/extensions/TRC721VotesUpgradeable.sol";
import {TRC20VotesUpgradeable} from "../../token/TRC20/extensions/TRC20VotesUpgradeable.sol";
import {SafeCast} from "@openzeppelin/tron-contracts/utils/math/SafeCast.sol";
import {Time} from "@openzeppelin/tron-contracts/utils/types/Time.sol";
import {TRC6372Utils} from "@openzeppelin/tron-contracts/utils/TRC6372Utils.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

abstract contract TRC20VotesTimestampMockUpgradeable is Initializable, TRC20VotesUpgradeable {
    function __TRC20VotesTimestampMock_init() internal onlyInitializing {}

    function __TRC20VotesTimestampMock_init_unchained() internal onlyInitializing {}
    function clock() public view override returns (uint48) {
        return Time.timestamp();
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view virtual override returns (string memory) {
        return TRC6372Utils.timestampClockMode(clock);
    }
}

abstract contract TRC721VotesTimestampMockUpgradeable is Initializable, TRC721VotesUpgradeable {
    function __TRC721VotesTimestampMock_init() internal onlyInitializing {}

    function __TRC721VotesTimestampMock_init_unchained() internal onlyInitializing {}
    function clock() public view override returns (uint48) {
        return Time.timestamp();
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public view virtual override returns (string memory) {
        return TRC6372Utils.timestampClockMode(clock);
    }
}
