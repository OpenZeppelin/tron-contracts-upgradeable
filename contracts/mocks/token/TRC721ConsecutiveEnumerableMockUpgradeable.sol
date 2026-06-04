// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {TRC721Upgradeable} from "../../token/TRC721/TRC721Upgradeable.sol";
import {TRC721ConsecutiveUpgradeable} from "../../token/TRC721/extensions/TRC721ConsecutiveUpgradeable.sol";
import {TRC721EnumerableUpgradeable} from "../../token/TRC721/extensions/TRC721EnumerableUpgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

contract TRC721ConsecutiveEnumerableMockUpgradeable is Initializable, TRC721ConsecutiveUpgradeable, TRC721EnumerableUpgradeable {
    function __TRC721ConsecutiveEnumerableMock_init(
        string memory name,
        string memory symbol,
        address[] memory receivers,
        uint96[] memory amounts
    ) internal onlyInitializing {
        __TRC721_init_unchained(name, symbol);
        __TRC721ConsecutiveEnumerableMock_init_unchained(name, symbol, receivers, amounts);
    }

    function __TRC721ConsecutiveEnumerableMock_init_unchained(
        string memory,
        string memory,
        address[] memory receivers,
        uint96[] memory amounts
    ) internal onlyInitializing {
        for (uint256 i = 0; i < receivers.length; ++i) {
            _mintConsecutive(receivers[i], amounts[i]);
        }
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(TRC721Upgradeable, TRC721EnumerableUpgradeable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function _ownerOf(uint256 tokenId) internal view virtual override(TRC721Upgradeable, TRC721ConsecutiveUpgradeable) returns (address) {
        return super._ownerOf(tokenId);
    }

    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal virtual override(TRC721ConsecutiveUpgradeable, TRC721EnumerableUpgradeable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 amount) internal virtual override(TRC721Upgradeable, TRC721EnumerableUpgradeable) {
        super._increaseBalance(account, amount);
    }
}
