// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {EtherUSD} from "../src/EtherUSD.sol";

contract EtherUSDScript is Script {
    function setUp() public {}

    EtherUSD etherUSD;

    function run() public {
        vm.startBroadcast();
        etherUSD = new EtherUSD();
        vm.stopBroadcast();
    }
}
