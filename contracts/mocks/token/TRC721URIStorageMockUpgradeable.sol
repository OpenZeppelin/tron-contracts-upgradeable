// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {TRC721URIStorageUpgradeable} from "../../token/TRC721/extensions/TRC721URIStorageUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract TRC721URIStorageMockUpgradeable is Initializable, TRC721URIStorageUpgradeable {
    string private _baseTokenURI;

    function __TRC721URIStorageMock_init() internal onlyInitializing {
    }

    function __TRC721URIStorageMock_init_unchained() internal onlyInitializing {
    }
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string calldata newBaseTokenURI) public {
        _baseTokenURI = newBaseTokenURI;
    }
}
