// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ITRC20} from "@openzeppelin/tron-contracts/contracts/token/TRC20/ITRC20.sol";
import {ITRC3156FlashBorrower} from "@openzeppelin/tron-contracts/contracts/interfaces/ITRC3156FlashBorrower.sol";
import {Address} from "@openzeppelin/tron-contracts/contracts/utils/Address.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * @dev WARNING: this ITRC3156FlashBorrower mock implementation is for testing purposes ONLY.
 * Writing a secure flash lock borrower is not an easy task, and should be done with the utmost care.
 * This is not an example of how it should be done, and no pattern present in this mock should be considered secure.
 * Following best practices, always have your contract properly audited before using them to manipulate important funds on
 * live networks.
 */
contract TRC3156FlashBorrowerMockUpgradeable is Initializable, ITRC3156FlashBorrower {
    bytes32 internal constant _RETURN_VALUE = keccak256("ERC3156FlashBorrower.onFlashLoan");

    bool _enableApprove;
    bool _enableReturn;

    event BalanceOf(address token, address account, uint256 value);
    event TotalSupply(address token, uint256 value);

    function __TRC3156FlashBorrowerMock_init(bool enableReturn, bool enableApprove) internal onlyInitializing {
        __TRC3156FlashBorrowerMock_init_unchained(enableReturn, enableApprove);
    }

    function __TRC3156FlashBorrowerMock_init_unchained(bool enableReturn, bool enableApprove) internal onlyInitializing {
        _enableApprove = enableApprove;
        _enableReturn = enableReturn;
    }

    function onFlashLoan(
        address /*initiator*/,
        address token,
        uint256 amount,
        uint256 fee,
        bytes calldata data
    ) public returns (bytes32) {
        require(msg.sender == token);

        emit BalanceOf(token, address(this), ITRC20(token).balanceOf(address(this)));
        emit TotalSupply(token, ITRC20(token).totalSupply());

        if (data.length > 0) {
            // WARNING: This code is for testing purposes only! Do not use.
            Address.functionCall(token, data);
        }

        if (_enableApprove) {
            ITRC20(token).approve(token, amount + fee);
        }

        return _enableReturn ? _RETURN_VALUE : bytes32(0);
    }
}
