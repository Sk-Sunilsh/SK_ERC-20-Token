//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";

import {Token} from "../src/Token.sol";

contract DeployToken is Script {
    uint256 public constant supply = 1000000 ether;

    function run() external returns (Token) {
        vm.startBroadcast();
        Token token = new Token(supply);
        vm.stopBroadcast();
        return token;
    }
}
