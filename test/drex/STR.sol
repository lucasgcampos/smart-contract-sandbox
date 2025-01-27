pragma solidity ^0.8.19;

// Sistema de Transferência de Reservas
contract STR {
    
    RealDigital realDigitalContract;
    address[] participants;

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

    function requestToMint(uint amount) external {
        realDigitalContract.mint(msg.sender, amount);
    }

    function requestToBurn(uint amount) external {
        realDigitalContract.burnFrom(msg.sender, amount);
    }
 }