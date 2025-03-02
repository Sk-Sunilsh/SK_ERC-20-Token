//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";
import {DeployToken} from "../script/DeployToken.s.sol";

contract TokenTest is Test {
    Token public token;
    DeployToken public deployer;
    uint256 public constant supply = 1000000 ether;
    address public kanna;
    address public hari;

    function setUp() public {
        deployer = new DeployToken();
        token = deployer.run();

        kanna = makeAddr("kanna");
        hari = makeAddr("hari");

        vm.prank(msg.sender);
        token.transfer(kanna, supply);
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), supply);
    }

    function testInitialBalance() public {
        assertEq(token.balanceOf(kanna), supply);
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;
        vm.prank(kanna);
        token.approve(hari, initialAllowance);
        uint256 transferAmount = 500;

        vm.prank(hari);
        token.transferFrom(kanna, hari, transferAmount);
        assertEq(token.balanceOf(hari), transferAmount);
        assertEq(token.allowance(kanna, hari), initialAllowance - transferAmount);
    }
}
