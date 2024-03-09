## Smart Contract Sandbox
A safe place to play with smart contract.

### Contracts

#### [EtherUSD](https://sepolia.etherscan.io/address/0x5ecDF773A508262712A785C4233F3752bb9e7417)
The contract is a hands-on demo, demonstrating how you can blend blockchain with real-world info, like the ETH/USD value. Feel free to use the following command to interact with it:
```shell
cast call --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY 0x5ecDF773A508262712A785C4233F3752bb9e7417 "getEthValueInUsd()(uint256)"
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

https://book.getfoundry.sh/