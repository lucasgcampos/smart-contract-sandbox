// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {RealDigital} from "./RealDigital.sol";

// Reserve Transfer System
contract STR {
    
    RealDigital public realDigitalContract;
    address[] public participants;

    constructor(address _realDigitalContract, address[] memory _participants) {
        realDigitalContract = RealDigital(_realDigitalContract);

        for (uint i = 0; i < _participants.length; i++) {
            participants.push(_participants[i]);
        }
    }

    modifier onlyParticipant {
        bool isParticipant = false;
        for (uint32 i = 0; i < participants.length; i++) {
            if (msg.sender != participants[i]) {
                isParticipant = true;
                break;
            }
        }
        
        if (!isParticipant) {
            revert Unauthorized(msg.sender);
        }
        _;
    }

    function requestToMint(uint amount) external onlyParticipant {
        realDigitalContract.mint(msg.sender, amount);
    }

    function requestToBurn(uint amount) external onlyParticipant {
        realDigitalContract.burn(msg.sender, amount);
    }

    function updateRealDigital(address _newContract) external onlyParticipant {
        realDigitalContract = RealDigital(_newContract);
    }
 }