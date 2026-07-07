// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {TRC20MulticallMockUpgradeable} from "./token/TRC20MulticallMockUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

contract MulticallHelperUpgradeable is Initializable {
    function __MulticallHelper_init() internal onlyInitializing {}

    function __MulticallHelper_init_unchained() internal onlyInitializing {}
    function checkReturnValues(
        TRC20MulticallMockUpgradeable multicallToken,
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external {
        bytes[] memory calls = new bytes[](recipients.length);
        for (uint256 i = 0; i < recipients.length; i++) {
            calls[i] = abi.encodeCall(multicallToken.transfer, (recipients[i], amounts[i]));
        }

        bytes[] memory results = multicallToken.multicall(calls);
        for (uint256 i = 0; i < results.length; i++) {
            require(abi.decode(results[i], (bool)));
        }
    }
}
