// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RealDigital is ERC20 {

    address public str;
    address public swap;

    event Swap(address indexed from, address indexed to, uint amount);

    constructor(address _str, address _swap) ERC20("Real Digital", "RD") {
        str = _str;
        swap = _swap;
    }

    modifier onlySTR {
        require(msg.sender == str, "Unauthorized");
        _;
    }
    
    modifier onlySwap {
        require(msg.sender == swap, "Unauthorized");
        _;
    }

    function mint(address _participant, uint _amount) external onlySTR {
        _mint(_participant, _amount);
    }

    function burn(address _participant, uint _amount) external onlySTR {
        _burn(_participant, _amount);
    }

    function decimals() public view virtual override returns (uint8) {
        return 2;
    }

    function transferSwap(address _from, address _to, uint _amount) external onlySwap {
        require(balanceOf[_from] >= amount, "ERC20: transfer amount exceeds balance");
        
        unchecked {
            balanceOf[_from] -= amount;
            balanceOf[_to] += amount;
        }

        emit Swap(from, to, amount);
    }
}