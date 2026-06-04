// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20FlashMintUpgradeable} from "../../token/TRC20/extensions/TRC20FlashMintUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

abstract contract TRC20FlashMintMockUpgradeable is Initializable, TRC20FlashMintUpgradeable {
    uint256 _flashFeeAmount;
    address _flashFeeReceiverAddress;

    function __TRC20FlashMintMock_init() internal onlyInitializing {
    }

    function __TRC20FlashMintMock_init_unchained() internal onlyInitializing {
    }
    function setFlashFee(uint256 amount) public {
        _flashFeeAmount = amount;
    }

    function _flashFee(address, uint256) internal view override returns (uint256) {
        return _flashFeeAmount;
    }

    function setFlashFeeReceiver(address receiver) public {
        _flashFeeReceiverAddress = receiver;
    }

    function _flashFeeReceiver() internal view override returns (address) {
        return _flashFeeReceiverAddress;
    }
}
