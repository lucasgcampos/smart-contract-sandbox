// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RealDigital is ERC20 {

    address str;

    constructor(address _str) ERC20("Real Digital", "RD") {
        str = _str;
    }

    modifier onlySTR {
        require(msg.sender == str, "Unauthorized");
        _;
    }

    function mint(address _participant, uint _amount) external onlySTR {
        _mint(_participant, _amount);
    }

    function burnFrom(address _participant, uint _amount) external onlySTR {
        _burn(_participant, _amount);
    }

    function decimals() public view virtual override returns (uint8) {
        return 2;
    }
}