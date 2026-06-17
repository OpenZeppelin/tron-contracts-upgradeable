// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ITRC165} from "@openzeppelin/tron-contracts/contracts/utils/introspection/ITRC165.sol";
import {Initializable} from "@openzeppelin/tron-contracts/contracts/proxy/utils/Initializable.sol";

/**
 * https://eips.ethereum.org/EIPS/eip-214#specification
 * From the specification:
 * > Any attempts to make state-changing operations inside an execution instance with STATIC set to true will instead
 * throw an exception.
 * > These operations include [...], LOG0, LOG1, LOG2, [...]
 *
 * therefore, because this contract is staticcall'd we need to not emit events (which is how solidity-coverage works)
 * solidity-coverage ignores the /mocks folder, so we duplicate its implementation here to avoid instrumenting it
 */
contract SupportsInterfaceWithLookupMockUpgradeable is Initializable, ITRC165 {
    /*
     * bytes4(keccak256('supportsInterface(bytes4)')) == 0x01ffc9a7
     */
    bytes4 public constant INTERFACE_ID_TRC165 = 0x01ffc9a7;

    /**
     * @dev A mapping of interface id to whether or not it's supported.
     */
    mapping(bytes4 interfaceId => bool) private _supportedInterfaces;

    /**
     * @dev A contract implementing SupportsInterfaceWithLookup
     * implement ERC-165 itself.
     */
    function __SupportsInterfaceWithLookupMock_init() internal onlyInitializing {
        __SupportsInterfaceWithLookupMock_init_unchained();
    }

    function __SupportsInterfaceWithLookupMock_init_unchained() internal onlyInitializing {
        _registerInterface(INTERFACE_ID_TRC165);
    }

    /**
     * @dev Implement supportsInterface(bytes4) using a lookup table.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return _supportedInterfaces[interfaceId];
    }

    /**
     * @dev Private method for registering an interface.
     */
    function _registerInterface(bytes4 interfaceId) internal {
        require(interfaceId != 0xffffffff, "TRC165InterfacesSupported: invalid interface id");
        _supportedInterfaces[interfaceId] = true;
    }
}

contract TRC165InterfacesSupportedUpgradeable is Initializable, SupportsInterfaceWithLookupMockUpgradeable {
    function __TRC165InterfacesSupported_init(bytes4[] memory interfaceIds) internal onlyInitializing {
        __SupportsInterfaceWithLookupMock_init_unchained();
        __TRC165InterfacesSupported_init_unchained(interfaceIds);
    }

    function __TRC165InterfacesSupported_init_unchained(bytes4[] memory interfaceIds) internal onlyInitializing {
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            _registerInterface(interfaceIds[i]);
        }
    }
}

// Similar to TRC165InterfacesSupported, but revert (without reason) when an interface is not supported
contract TRC165RevertInvalidUpgradeable is Initializable, SupportsInterfaceWithLookupMockUpgradeable {
    function __TRC165RevertInvalid_init(bytes4[] memory interfaceIds) internal onlyInitializing {
        __SupportsInterfaceWithLookupMock_init_unchained();
        __TRC165RevertInvalid_init_unchained(interfaceIds);
    }

    function __TRC165RevertInvalid_init_unchained(bytes4[] memory interfaceIds) internal onlyInitializing {
        for (uint256 i = 0; i < interfaceIds.length; i++) {
            _registerInterface(interfaceIds[i]);
        }
    }

    function supportsInterface(bytes4 interfaceId) public view override returns (bool) {
        require(super.supportsInterface(interfaceId));
        return true;
    }
}

contract TRC165MaliciousDataUpgradeable is Initializable {
    function __TRC165MaliciousData_init() internal onlyInitializing {
    }

    function __TRC165MaliciousData_init_unchained() internal onlyInitializing {
    }
    function supportsInterface(bytes4) public pure returns (bool) {
        assembly {
            mstore(0, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            return(0, 32)
        }
    }
}

contract TRC165MissingDataUpgradeable is Initializable {
    function __TRC165MissingData_init() internal onlyInitializing {
    }

    function __TRC165MissingData_init_unchained() internal onlyInitializing {
    }
    function supportsInterface(bytes4 interfaceId) public view {} // missing return
}

contract TRC165NotSupportedUpgradeable is Initializable {    function __TRC165NotSupported_init() internal onlyInitializing {
    }

    function __TRC165NotSupported_init_unchained() internal onlyInitializing {
    }
}

contract TRC165ReturnBombMockUpgradeable is Initializable, ITRC165 {
    function __TRC165ReturnBombMock_init() internal onlyInitializing {
    }

    function __TRC165ReturnBombMock_init_unchained() internal onlyInitializing {
    }
    function supportsInterface(bytes4 interfaceId) public pure override returns (bool) {
        if (interfaceId == type(ITRC165).interfaceId) {
            assembly {
                mstore(0, 1)
            }
        }
        assembly {
            return(0, 101500)
        }
    }
}
