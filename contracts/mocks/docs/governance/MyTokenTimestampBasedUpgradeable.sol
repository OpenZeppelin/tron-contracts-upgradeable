// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {TRC20Upgradeable} from "../../../token/TRC20/TRC20Upgradeable.sol";
import {TRC20PermitUpgradeable} from "../../../token/TRC20/extensions/TRC20PermitUpgradeable.sol";
import {TRC20VotesUpgradeable} from "../../../token/TRC20/extensions/TRC20VotesUpgradeable.sol";
import {NoncesUpgradeable} from "../../../utils/NoncesUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

contract MyTokenTimestampBasedUpgradeable is Initializable, TRC20Upgradeable, TRC20PermitUpgradeable, TRC20VotesUpgradeable {
    function __MyTokenTimestampBased_init() internal onlyInitializing {
        __TRC20_init_unchained("MyTokenTimestampBased", "MTK");
        __TIP712_init_unchained("MyTokenTimestampBased", "1");
        __TRC20Permit_init_unchained("MyTokenTimestampBased");
    }

    function __MyTokenTimestampBased_init_unchained() internal onlyInitializing {}

    // Overrides ITRC6372 functions to make the token & governor timestamp-based

    function clock() public view override returns (uint48) {
        return uint48(block.timestamp);
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public pure override returns (string memory) {
        return "mode=timestamp";
    }

    // The functions below are overrides required by Solidity.

    function _update(address from, address to, uint256 amount) internal override(TRC20Upgradeable, TRC20VotesUpgradeable) {
        super._update(from, to, amount);
    }

    function nonces(address owner) public view virtual override(TRC20PermitUpgradeable, NoncesUpgradeable) returns (uint256) {
        return super.nonces(owner);
    }
}
