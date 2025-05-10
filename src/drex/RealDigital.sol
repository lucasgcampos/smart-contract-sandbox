// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RealDigital is ERC20 {

    address public str;
    address public bacen;
    address public swap;

    event Swap(address indexed from, address indexed to, uint amount);

    error Unauthorized(address sender, address owner);

    constructor() ERC20("Real Digital", "RD") {
        bacen = msg.sender;
    }

    modifier onlySTR {
        if (msg.sender != str) {
            revert Unauthorized(msg.sender, str);
        }
    
        _;
    }
    
    modifier onlySwap {
        if (msg.sender != swap) {
            revert Unauthorized(msg.sender, swap);
        }
        _;
    }
    
    modifier onlyBacen {
        if (msg.sender != bacen) {
            revert Unauthorized(msg.sender, bacen);
        }
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
        _transfer(_from, _to, _amount);
        emit Swap(_from, _to, _amount);
    }

    function setSTR(address _str) public onlyBacen {
        str = _str;
    }
    
    function setSwap(address _swap) public onlyBacen {
        swap = _swap;
    }
}