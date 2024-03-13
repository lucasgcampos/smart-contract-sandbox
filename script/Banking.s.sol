// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Banking} from "../src/Banking.sol";

contract BankingScript is Script {
    function setUp() public {}

    Banking banking;

    function run() public {
        vm.startBroadcast();
        banking = new Banking();
        vm.stopBroadcast();
    }
}
