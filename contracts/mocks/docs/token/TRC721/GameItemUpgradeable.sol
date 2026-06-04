// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {TRC721URIStorageUpgradeable, TRC721Upgradeable} from "../../../../token/TRC721/extensions/TRC721URIStorageUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

contract GameItemUpgradeable is Initializable, TRC721URIStorageUpgradeable {
    uint256 private _nextTokenId;

    function __GameItem_init() internal onlyInitializing {
        __TRC721_init_unchained("GameItem", "ITM");
    }

    function __GameItem_init_unchained() internal onlyInitializing {}

    function awardItem(address player, string memory tokenURI) public returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _mint(player, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }
}
