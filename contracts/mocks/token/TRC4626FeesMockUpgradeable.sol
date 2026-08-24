// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC4626FeesUpgradeable} from "../docs/TRC4626FeesUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

abstract contract TRC4626FeesMockUpgradeable is Initializable, TRC4626FeesUpgradeable {
    uint256 private _entryFeeBasisPointValue;
    address private _entryFeeRecipientValue;
    uint256 private _exitFeeBasisPointValue;
    address private _exitFeeRecipientValue;

    function __TRC4626FeesMock_init(
        uint256 entryFeeBasisPoints,
        address entryFeeRecipient,
        uint256 exitFeeBasisPoints,
        address exitFeeRecipient
    ) internal onlyInitializing {
        __TRC4626FeesMock_init_unchained(entryFeeBasisPoints, entryFeeRecipient, exitFeeBasisPoints, exitFeeRecipient);
    }

    function __TRC4626FeesMock_init_unchained(
        uint256 entryFeeBasisPoints,
        address entryFeeRecipient,
        uint256 exitFeeBasisPoints,
        address exitFeeRecipient
    ) internal onlyInitializing {
        _entryFeeBasisPointValue = entryFeeBasisPoints;
        _entryFeeRecipientValue = entryFeeRecipient;
        _exitFeeBasisPointValue = exitFeeBasisPoints;
        _exitFeeRecipientValue = exitFeeRecipient;
    }

    function _entryFeeBasisPoints() internal view virtual override returns (uint256) {
        return _entryFeeBasisPointValue;
    }

    function _entryFeeRecipient() internal view virtual override returns (address) {
        return _entryFeeRecipientValue;
    }

    function _exitFeeBasisPoints() internal view virtual override returns (uint256) {
        return _exitFeeBasisPointValue;
    }

    function _exitFeeRecipient() internal view virtual override returns (address) {
        return _exitFeeRecipientValue;
    }
}
