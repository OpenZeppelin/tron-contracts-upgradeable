// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ContextMockUpgradeable} from "./ContextMockUpgradeable.sol";
import {ContextUpgradeable} from "../utils/ContextUpgradeable.sol";
import {MulticallUpgradeable} from "../utils/MulticallUpgradeable.sol";
import {TRC2771ContextUpgradeable} from "../metatx/TRC2771ContextUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

// By inheriting from TRC2771Context, Context's internal functions are overridden automatically
contract TRC2771ContextMockUpgradeable is
    Initializable,
    ContextMockUpgradeable,
    TRC2771ContextUpgradeable,
    MulticallUpgradeable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor(address trustedForwarder) TRC2771ContextUpgradeable(trustedForwarder) {
        emit Sender(_msgSender()); // _msgSender() should be accessible during construction
    }

    function _msgSender() internal view override(ContextUpgradeable, TRC2771ContextUpgradeable) returns (address) {
        return TRC2771ContextUpgradeable._msgSender();
    }

    function _msgData() internal view override(ContextUpgradeable, TRC2771ContextUpgradeable) returns (bytes calldata) {
        return TRC2771ContextUpgradeable._msgData();
    }

    function _contextSuffixLength()
        internal
        view
        override(ContextUpgradeable, TRC2771ContextUpgradeable)
        returns (uint256)
    {
        return TRC2771ContextUpgradeable._contextSuffixLength();
    }
}
