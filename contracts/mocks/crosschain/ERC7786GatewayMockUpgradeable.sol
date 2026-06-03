// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {IERC7786GatewaySourceUpgradeable, IERC7786RecipientUpgradeable} from "../../interfaces/draft-IERC7786Upgradeable.sol";
import {InteroperableAddressUpgradeable} from "../../utils/draft-InteroperableAddressUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract ERC7786GatewayMockUpgradeable is Initializable, IERC7786GatewaySourceUpgradeable {
    using InteroperableAddressUpgradeable for bytes;

    error InvalidDestination();
    error ReceiverError();

    uint256 private _lastReceiveId;

    function __ERC7786GatewayMock_init() internal onlyInitializing {
    }

    function __ERC7786GatewayMock_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC7786GatewaySourceUpgradeable
    function supportsAttribute(bytes4 /*selector*/) public view virtual returns (bool) {
        return false;
    }

    /// @inheritdoc IERC7786GatewaySourceUpgradeable
    function sendMessage(
        bytes calldata recipient,
        bytes calldata payload,
        bytes[] calldata attributes
    ) public payable virtual returns (bytes32 sendId) {
        // attributes are not supported
        if (attributes.length > 0) {
            revert UnsupportedAttribute(bytes4(attributes[0]));
        }

        // parse recipient
        (bool success, uint256 chainid, address target) = recipient.tryParseEvmV1Calldata();
        require(success && chainid == block.chainid, InvalidDestination());

        // perform call
        bytes4 magic = IERC7786RecipientUpgradeable(target).receiveMessage{value: msg.value}(
            bytes32(++_lastReceiveId),
            InteroperableAddressUpgradeable.formatEvmV1(block.chainid, msg.sender),
            payload
        );
        require(magic == IERC7786RecipientUpgradeable.receiveMessage.selector, ReceiverError());

        // emit standard event
        emit MessageSent(
            bytes32(0),
            InteroperableAddressUpgradeable.formatEvmV1(block.chainid, msg.sender),
            recipient,
            payload,
            msg.value,
            attributes
        );

        return 0;
    }
}
