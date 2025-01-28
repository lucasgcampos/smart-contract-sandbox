// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {RealDigital} from "./RealDigital.sol";

// Reserve Transfer System
contract STR {
    
    RealDigital public realDigitalContract;
    address[] public participants;

    constructor(address _realDigitalContract) {
        realDigitalContract = RealDigital(_realDigitalContract);
        participants.push(msg.sender);
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