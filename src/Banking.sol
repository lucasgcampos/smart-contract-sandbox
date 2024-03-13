// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Banking {
    address owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}
}
