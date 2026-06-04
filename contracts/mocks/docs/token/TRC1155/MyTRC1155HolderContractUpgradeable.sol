// contracts/MyTRC1155HolderContract.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TRC1155Holder} from "@openzeppelin/tron-contracts/contracts/token/TRC1155/utils/TRC1155Holder.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

contract MyTRC1155HolderContractUpgradeable is Initializable, TRC1155Holder {    function __MyTRC1155HolderContract_init() internal onlyInitializing {
    }

    function __MyTRC1155HolderContract_init_unchained() internal onlyInitializing {
    }
}
