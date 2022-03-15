// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

// import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {ERC20} from "openzeppelin-erc20/ERC20.sol";

contract Contract is ERC20 {
    constructor() ERC20("MyToken", "MTKN") {
        // mints 1 million tokenss
        _mint(msg.sender, 1000000 * (10**uint256(18)));
    }
}
