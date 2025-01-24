// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RealDigital is ERC20 {
    constructor() ERC20("Real Digital", "RD") {
        _mint(msg.sender, 1000 * 100);
    }

    function decimals() public view virtual override returns (uint8) {
        return 2;
    }
}