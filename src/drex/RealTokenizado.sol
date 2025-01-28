// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RealTokenizado is ERC20 {

    address owner;

    constructor(
        string memory _name, 
        string memory _symbol,
        address _owner
    ) ERC20(_name, _symbol) {
        owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized");
        _;
    }

    function mint(address _client, uint _amount) external {
        _mint(_client, _amount);
    }

    function burn(address _client, uint _amount) external {
        _burn(_client, _amount);
    }
}