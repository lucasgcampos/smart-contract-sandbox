// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {RealDigital} from "./RealDigital.sol";
import {RealTokenizado} from "./RealTokenizado.sol";

contract SwapOneStep {

    address[] participants;

    constructor(address _realDigitalContract, address[] memory _participants) {
        for (uint i = 0; i < _participants.length; i++) {
            participants.push(_participants[i]);
        }
    }

    modifier onlyParticipant {
        bool isParticipant = false;
        for (uint32 i = 0; i < participants.length; i++) {
            if (msg.sender != participants[i]) {
                isParticipant = true;
            }
        }

        require(isParticipant, "Unauthorized");
        _;
    }

    function swap(
        address _realDigital,
        address _fromRealTokenizado,
        address _fromClient,
        address _toRealTokenizado,
        address _toClient,
        uint256 _amount
    ) external onlyParticipant {
        RealTokenizado toToken = RealTokenizado(_toRealTokenizado);
        RealTokenizado fromToken = RealTokenizado(_fromRealTokenizado);
        require(fromToken.balanceOf(_fromClient) >= _amount, "Unsufficient balance");
        
        // Transfer Real Digital
        RealDigital realDigital = RealDigital(_realDigital);
        realDigital.transferSwap(fromToken.owner(), toToken.owner(), _amount);

        // Swap Tokens
        fromToken.burn(_fromClient, _amount);
        toToken.mint(_toClient, _amount);
    }
}