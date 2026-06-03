// contracts/MyTRC1155HolderContract.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TRC1155HolderUpgradeable} from "../../../../token/TRC1155/utils/TRC1155HolderUpgradeable.sol";
import {Initializable} from "../../../../proxy/utils/Initializable.sol";

contract MyTRC1155HolderContractUpgradeable is Initializable, TRC1155HolderUpgradeable {    function __MyTRC1155HolderContract_init() internal onlyInitializing {
    }

    function __MyTRC1155HolderContract_init_unchained() internal onlyInitializing {
    }
}
