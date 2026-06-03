// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ITRC20Upgradeable} from "../../token/TRC20/ITRC20Upgradeable.sol";
import {ITRC20MetadataUpgradeable} from "../../token/TRC20/extensions/ITRC20MetadataUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

contract TRC20GetterHelperUpgradeable is Initializable {
    event TRC20TotalSupply(ITRC20Upgradeable token, uint256 totalSupply);
    event TRC20BalanceOf(ITRC20Upgradeable token, address account, uint256 balanceOf);
    event TRC20Allowance(ITRC20Upgradeable token, address owner, address spender, uint256 allowance);
    event TRC20Name(ITRC20MetadataUpgradeable token, string name);
    event TRC20Symbol(ITRC20MetadataUpgradeable token, string symbol);
    event TRC20Decimals(ITRC20MetadataUpgradeable token, uint8 decimals);

    function __TRC20GetterHelper_init() internal onlyInitializing {
    }

    function __TRC20GetterHelper_init_unchained() internal onlyInitializing {
    }
    function totalSupply(ITRC20Upgradeable token) external {
        emit TRC20TotalSupply(token, token.totalSupply());
    }

    function balanceOf(ITRC20Upgradeable token, address account) external {
        emit TRC20BalanceOf(token, account, token.balanceOf(account));
    }

    function allowance(ITRC20Upgradeable token, address owner, address spender) external {
        emit TRC20Allowance(token, owner, spender, token.allowance(owner, spender));
    }

    function name(ITRC20MetadataUpgradeable token) external {
        emit TRC20Name(token, token.name());
    }

    function symbol(ITRC20MetadataUpgradeable token) external {
        emit TRC20Symbol(token, token.symbol());
    }

    function decimals(ITRC20MetadataUpgradeable token) external {
        emit TRC20Decimals(token, token.decimals());
    }
}
