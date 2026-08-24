// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {TRC721Upgradeable} from "../../token/TRC721/TRC721Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

contract MyNFTUpgradeable is Initializable, TRC721Upgradeable {
    function __MyNFT_init() internal onlyInitializing {
        __TRC721_init_unchained("MyNFT", "MNFT");
    }

    function __MyNFT_init_unchained() internal onlyInitializing {}
}
