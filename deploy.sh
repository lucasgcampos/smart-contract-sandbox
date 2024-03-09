source .env
forge t
forge script script/EtherUSD.s.sol:EtherUSDScript --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY --broadcast