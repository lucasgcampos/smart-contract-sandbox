// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Banking {
    address private owner;

    constructor() {
        owner = payable(msg.sender);
    }

    error Unauthorized();

    receive() external payable {}

    function withdraw(uint256 _value) public payable {
        if (msg.sender != owner) {
            revert Unauthorized();
        }

        payable(owner).call{value: _value}("");
    }

    function balance() external view returns(uint256) {
        return address(this).balance;
    }
}
