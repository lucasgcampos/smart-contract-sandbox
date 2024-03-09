// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract EtherUSD {
    AggregatorV3Interface internal oracle;

    constructor() {
        oracle = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    function getEthValueInUsd() view external returns(uint256) {
        (,int256 priceUsd,,,) = oracle.latestRoundData();
        return uint256(priceUsd / 1e8);
    }
}
