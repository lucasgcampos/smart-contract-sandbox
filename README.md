## Smart Contract Sandbox
A safe place to play with smart contract.

### Contracts

#### [1. EtherUSD](https://sepolia.etherscan.io/address/0x5ecDF773A508262712A785C4233F3752bb9e7417)
The contract is a hands-on demo, demonstrating how you can blend blockchain with real-world info, like the ETH/USD value. Feel free to use the following command to interact with it:
```shell
cast call --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY 0x5ecDF773A508262712A785C4233F3752bb9e7417 "getEthValueInUsd()(uint256)"
```

#### [2. Banking](https://sepolia.etherscan.io/address/0x4D1770D66b50d0128d22933DCf8FcF3a594d4eC8)
It's an example of a smart contract capable of both receiving and withdrawing tokens, essentially mimicking the basic functionalities of a bank.

Balance:
```shell
cast call --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY 0x4D1770D66b50d0128d22933DCf8FcF3a594d4eC8 "balance()(uint256)"
```

Withdraw:
```shell
cast send --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY 0x4D1770D66b50d0128d22933DCf8FcF3a594d4eC8 "withdraw(uint256)()" <value>
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

https://book.getfoundry.sh/
