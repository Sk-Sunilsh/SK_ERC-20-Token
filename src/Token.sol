//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor(uint256 Supply) ERC20("SKToken", "SK") {
        _mint(msg.sender, Supply);
    }
}
