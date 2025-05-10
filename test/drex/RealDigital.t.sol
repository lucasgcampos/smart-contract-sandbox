pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {RealDigital} from "../../src/drex/RealDigital.sol";

contract RealDigitalTest is Test {
    
    RealDigital realDigital;
    address deployer = address(0xff);

    function setUp() public {
        vm.prank(deployer);
        realDigital = new RealDigital();
    }

    function test_inital_balance_of_deployer() public {
        assertEq(realDigital.balanceOf(deployer), 0);
    }
}
