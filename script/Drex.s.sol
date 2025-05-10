// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {STR} from "../src/drex/STR.sol";
import {SwapOneStep} from "../src/drex/SwapOneStep.sol";
import {RealDigital} from "../src/drex/RealDigital.sol";
import {RealTokenizado} from "../src/drex/RealTokenizado.sol";

contract DrexScript is Script {
    function setUp() public {}

    RealDigital realDigital;
    RealTokenizado purpleToken;
    RealTokenizado blackToken;
    STR str;
    SwapOneStep swap;

    // banks
    address purple = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    address black = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
    address[] owners = [purple, black];
    
    // clients
    address bob = 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f;
    address alice = 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720;

    function run() public {
        deployContracts();

        setupPurpleBank();
        setupBlackBank();

        swapFromBobPurpleToAliceBlack();
    }

    function deployContracts() private {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        realDigital = new RealDigital();
        str = new STR(address(realDigital), owners);
        swap = new SwapOneStep(address(realDigital), owners);

        realDigital.setSTR(address(str));
        realDigital.setSwap(address(swap));

        purpleToken = new RealTokenizado(purple, "Purple Bank", "PB");
        blackToken = new RealTokenizado(black, "Black Bank", "BB");

        vm.stopBroadcast();
    }

    function setupPurpleBank() private {
        vm.startBroadcast(0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d);
        purpleToken.setSwap(address(swap));

        str.requestToMint(100);
        purpleToken.mint(bob, 100);
        vm.stopBroadcast();
    }
    
    function setupBlackBank() private {
        vm.startBroadcast(0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a);
        blackToken.setSwap(address(swap));
        vm.stopBroadcast();
    }

    function swapFromBobPurpleToAliceBlack() private {
        console.log("Before:");
        console.log("Purple Digital: ", realDigital.balanceOf(purple));
        console.log("Black Digital: ", realDigital.balanceOf(black));
        console.log("Bob token: ", purpleToken.balanceOf(bob));
        console.log("Alice token: ", blackToken.balanceOf(alice));
        console.log("");
        console.log("Transfer 25 tokens from Bob (purple bank) to Alice (black bank)");
        console.log("");

        vm.startBroadcast(0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d);
        swap.swap(address(purpleToken), bob, address(blackToken), alice, 25);
        vm.stopBroadcast();

        console.log("After:");
        console.log("Purple Digital: ", realDigital.balanceOf(purple));
        console.log("Black Digital: ", realDigital.balanceOf(black));
        console.log("Bob token: ", purpleToken.balanceOf(bob));
        console.log("Alice token: ", blackToken.balanceOf(alice));
    }
}