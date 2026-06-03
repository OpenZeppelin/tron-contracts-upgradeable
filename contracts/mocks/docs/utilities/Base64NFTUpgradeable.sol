// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {TRC721Upgradeable} from "../../../token/TRC721/TRC721Upgradeable.sol";
import {StringsUpgradeable} from "../../../utils/StringsUpgradeable.sol";
import {Base64Upgradeable} from "../../../utils/Base64Upgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract Base64NFTUpgradeable is Initializable, TRC721Upgradeable {
    using StringsUpgradeable for uint256;

    function __Base64NFT_init() internal onlyInitializing {
        __TRC721_init_unchained("Base64NFT", "MTK");
    }

    function __Base64NFT_init_unchained() internal onlyInitializing {}

    // ...

    function tokenURI(uint256 tokenId) public pure override returns (string memory) {
        // Equivalent to:
        // {
        //   "name": "Base64NFT #1",
        //   // Replace with extra TRC-721 Metadata properties
        // }
        // prettier-ignore
        string memory dataURI = string.concat("{\"name\": \"Base64NFT #", tokenId.toString(), "\"}");

        return string.concat("data:application/json;base64,", Base64Upgradeable.encode(bytes(dataURI)));
    }
}
