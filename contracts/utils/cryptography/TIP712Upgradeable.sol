// SPDX-License-Identifier: MIT
// OpenZeppelin Tron Contracts (last updated v5.5.0) (utils/cryptography/TIP712.sol)

pragma solidity ^0.8.24;

import {MessageHashUtils} from "@openzeppelin/tron-contracts/utils/cryptography/MessageHashUtils.sol";
import {ITRC5267} from "@openzeppelin/tron-contracts/interfaces/ITRC5267.sol";
import {Initializable} from "@openzeppelin/tron-contracts/proxy/utils/Initializable.sol";

/**
 * @dev https://github.com/tronprotocol/tips/blob/master/tip-712.md[TIP-712] is a standard for hashing and signing of
 * typed structured data, the TRON-side analogue of https://eips.ethereum.org/EIPS/eip-712[EIP-712].
 *
 * The encoding scheme specified in the standard requires a domain separator and a hash of the typed structured data,
 * whose encoding is very generic and therefore its implementation in Solidity is not feasible, thus this contract
 * does not implement the encoding itself. Protocols need to implement the type-specific encoding they need in order to
 * produce the hash of their typed data using a combination of `abi.encode` and `keccak256`.
 *
 * This contract implements the TIP-712 domain separator ({_domainSeparatorV4}) that is used as part of the encoding
 * scheme, and the final step of the encoding to obtain the message digest that is then signed via ECDSA
 * ({_hashTypedDataV4}).
 *
 * The implementation of the domain separator was designed to be as efficient as possible while still properly updating
 * the chain id to protect against replay attacks on an eventual fork of the chain.
 *
 * NOTE: TIP-712 differs from EIP-712 only in the domain separator's `chainId`, which uses `block.chainid & 0xffffffff`
 * (the low four bytes — the value TRON exposes through `eth_chainId` and that off-chain signers use). The encoding,
 * hashing and signing are otherwise identical to EIP-712, and the `EIP712Domain` type hash is unchanged. TIP-712's
 * other differences (stripping the `0x41` address prefix and the `trcToken` atomic type) concern off-chain encoders
 * and application-level struct fields, not this base contract.
 *
 * NOTE: This contract implements the version of the encoding known as "v4", as implemented by the JSON RPC method
 * https://docs.metamask.io/guide/signing-data.html[`eth_signTypedDataV4` in MetaMask].
 *
 * NOTE: The upgradeable version of this contract does not use an immutable cache and recomputes the domain separator
 * each time {_domainSeparatorV4} is called. This is cheaper than accessing a cached version in cold storage.
 */
abstract contract TIP712Upgradeable is Initializable, ITRC5267 {
    bytes32 private constant TYPE_HASH =
        keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)");

    /// @custom:storage-location erc7201:openzeppelin.storage.TIP712
    struct TIP712Storage {
        string _name;
        string _version;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.TIP712")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant TIP712StorageLocation = 0x6d897d3df437b68bba92563d2efa8f325a3f31b060df06ba17e6107d49201a00;

    function _getTIP712Storage() private pure returns (TIP712Storage storage $) {
        assembly {
            $.slot := TIP712StorageLocation
        }
    }

    /**
     * @dev Initializes the domain separator and parameter caches.
     *
     * The meaning of `name` and `version` is specified in
     * https://eips.ethereum.org/EIPS/eip-712#definition-of-domainseparator[EIP-712]:
     *
     * - `name`: the user readable name of the signing domain, i.e. the name of the DApp or the protocol.
     * - `version`: the current major version of the signing domain.
     *
     * NOTE: These parameters cannot be changed except through a xref:learn::upgrading-smart-contracts.adoc[smart
     * contract upgrade].
     *
     * WARNING: This concerns the constructor-based variant of this contract. When `name` or `version` does not fit in
     * a `ShortString` (i.e. is 32 bytes or longer), the constructor writes it to the `_nameFallback`/`_versionFallback`
     * storage variables. Under a `delegatecall`-based deployment (minimal proxy/clone) that constructor never runs in
     * the proxy's storage context, so the fallbacks stay empty while {_domainSeparatorV4} still uses the
     * implementation's immutable `_hashedName`/`_hashedVersion`. As a result {eip712Domain} reports an empty
     * `name`/`version` that does not match the separator used for verification, breaking off-chain domain discovery.
     * Keep `name` and `version` within 31 bytes in that case. The upgradeable variant is not affected: it stores
     * `name` and `version` as plain strings in namespaced storage, written by its initializer and read back by both
     * {_domainSeparatorV4} and {eip712Domain}.
     */
    function __TIP712_init(string memory name, string memory version) internal onlyInitializing {
        __TIP712_init_unchained(name, version);
    }

    function __TIP712_init_unchained(string memory name, string memory version) internal onlyInitializing {
        TIP712Storage storage $ = _getTIP712Storage();
        $._name = name;
        $._version = version;
    }

    /**
     * @dev Returns the domain separator for the current chain.
     */
    function _domainSeparatorV4() internal view returns (bytes32) {
        return _buildDomainSeparator();
    }

    function _buildDomainSeparator() private view returns (bytes32) {
        // TIP-712 defines the domain separator's `chainId` as `block.chainid & 0xffffffff` (the low four bytes),
        // matching the value off-chain TRON signers and `eth_chainId` use. This is a no-op on networks where the
        // CHAINID opcode already returns four bytes.
        return
            keccak256(
                abi.encode(
                    TYPE_HASH,
                    _TIP712NameHash(),
                    _TIP712VersionHash(),
                    block.chainid & 0xffffffff,
                    address(this)
                )
            );
    }

    /**
     * @dev Given an already https://eips.ethereum.org/EIPS/eip-712#definition-of-hashstruct[hashed struct], this
     * function returns the hash of the fully encoded TIP712 message for this domain.
     *
     * This hash can be used together with {ECDSA-recover} to obtain the signer of a message. For example:
     *
     * ```solidity
     * bytes32 digest = _hashTypedDataV4(keccak256(abi.encode(
     *     keccak256("Mail(address to,string contents)"),
     *     mailTo,
     *     keccak256(bytes(mailContents))
     * )));
     * address signer = ECDSA.recover(digest, signature);
     * ```
     */
    function _hashTypedDataV4(bytes32 structHash) internal view virtual returns (bytes32) {
        return MessageHashUtils.toTypedDataHash(_domainSeparatorV4(), structHash);
    }

    /// @inheritdoc ITRC5267
    function eip712Domain()
        public
        view
        virtual
        returns (
            bytes1 fields,
            string memory name,
            string memory version,
            uint256 chainId,
            address verifyingContract,
            bytes32 salt,
            uint256[] memory extensions
        )
    {
        return (
            hex"0f", // 01111
            _TIP712Name(),
            _TIP712Version(),
            block.chainid & 0xffffffff,
            address(this),
            bytes32(0),
            new uint256[](0)
        );
    }

    /**
     * @dev The name parameter for the TIP712 domain.
     *
     * NOTE: This function reads from storage by default, but can be redefined to return a constant value if gas costs
     * are a concern.
     */
    function _TIP712Name() internal view virtual returns (string memory) {
        TIP712Storage storage $ = _getTIP712Storage();
        return $._name;
    }

    /**
     * @dev The version parameter for the TIP712 domain.
     *
     * NOTE: This function reads from storage by default, but can be redefined to return a constant value if gas costs
     * are a concern.
     */
    function _TIP712Version() internal view virtual returns (string memory) {
        TIP712Storage storage $ = _getTIP712Storage();
        return $._version;
    }

    /**
     * @dev The hash of the name parameter for the TIP712 domain.
     *
     * NOTE: In previous versions this function was virtual. In this version you should override `_TIP712Name` instead.
     */
    function _TIP712NameHash() internal view returns (bytes32) {
        return keccak256(bytes(_TIP712Name()));
    }

    /**
     * @dev The hash of the version parameter for the TIP712 domain.
     *
     * NOTE: In previous versions this function was virtual. In this version you should override `_TIP712Version` instead.
     */
    function _TIP712VersionHash() internal view returns (bytes32) {
        return keccak256(bytes(_TIP712Version()));
    }
}
