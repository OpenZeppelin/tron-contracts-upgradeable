// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {TRC721Upgradeable} from "../../token/TRC721/TRC721Upgradeable.sol";
import {TRC721ConsecutiveUpgradeable} from "../../token/TRC721/extensions/TRC721ConsecutiveUpgradeable.sol";
import {TRC721PausableUpgradeable} from "../../token/TRC721/extensions/TRC721PausableUpgradeable.sol";
import {TRC721VotesUpgradeable} from "../../token/TRC721/extensions/TRC721VotesUpgradeable.sol";
import {TIP712Upgradeable} from "../../utils/cryptography/TIP712Upgradeable.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

/**
 * @title TRC721ConsecutiveMock
 */
contract TRC721ConsecutiveMockUpgradeable is
    Initializable,
    TRC721ConsecutiveUpgradeable,
    TRC721PausableUpgradeable,
    TRC721VotesUpgradeable
{
    uint96 private _offset;

    function __TRC721ConsecutiveMock_init(
        string memory name,
        string memory symbol,
        uint96 offset,
        address[] memory delegates,
        address[] memory receivers,
        uint96[] memory amounts
    ) internal onlyInitializing {
        __TRC721_init_unchained(name, symbol);
        __TIP712_init_unchained(name, "1");
        __TRC721ConsecutiveMock_init_unchained(name, symbol, offset, delegates, receivers, amounts);
    }

    function __TRC721ConsecutiveMock_init_unchained(
        string memory,
        string memory,
        uint96 offset,
        address[] memory delegates,
        address[] memory receivers,
        uint96[] memory amounts
    ) internal onlyInitializing {
        _offset = offset;

        for (uint256 i = 0; i < delegates.length; ++i) {
            _delegate(delegates[i], delegates[i]);
        }

        for (uint256 i = 0; i < receivers.length; ++i) {
            _mintConsecutive(receivers[i], amounts[i]);
        }
    }

    function _firstConsecutiveId() internal view virtual override returns (uint96) {
        return _offset;
    }

    function _ownerOf(
        uint256 tokenId
    ) internal view virtual override(TRC721Upgradeable, TRC721ConsecutiveUpgradeable) returns (address) {
        return super._ownerOf(tokenId);
    }

    function _update(
        address to,
        uint256 tokenId,
        address auth
    )
        internal
        virtual
        override(TRC721ConsecutiveUpgradeable, TRC721PausableUpgradeable, TRC721VotesUpgradeable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(
        address account,
        uint128 amount
    ) internal virtual override(TRC721Upgradeable, TRC721VotesUpgradeable) {
        super._increaseBalance(account, amount);
    }
}

contract TRC721ConsecutiveNoConstructorMintMockUpgradeable is Initializable, TRC721ConsecutiveUpgradeable {
    function __TRC721ConsecutiveNoConstructorMintMock_init(
        string memory name,
        string memory symbol
    ) internal onlyInitializing {
        __TRC721_init_unchained(name, symbol);
        __TRC721ConsecutiveNoConstructorMintMock_init_unchained(name, symbol);
    }

    function __TRC721ConsecutiveNoConstructorMintMock_init_unchained(
        string memory,
        string memory
    ) internal onlyInitializing {
        _mint(msg.sender, 0);
    }
}
