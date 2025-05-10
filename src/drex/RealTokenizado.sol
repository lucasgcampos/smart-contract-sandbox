// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RealTokenizado is ERC20 {

    address public owner;
    address public swap;

    error Unauthorized(address _sender, address _owner);

    constructor(
        address _owner,
        string memory _name, 
        string memory _symbol
    ) ERC20(_name, _symbol) {
        owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized");
        _;
    }
    
    modifier onlySwapOrOwner() {
        if (msg.sender != owner && msg.sender != swap) {
            revert Unauthorized(msg.sender, owner);
        }
        
        _;
    }

    function mint(address _client, uint _amount) external onlySwapOrOwner {
        _mint(_client, _amount);
    }

    function burn(address _client, uint _amount) external onlySwapOrOwner {
        _burn(_client, _amount);
    }

    function setSwap(address _swap) public onlyOwner {
        swap = _swap;
    }
}