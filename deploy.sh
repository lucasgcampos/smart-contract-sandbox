source .env
forge t

# EtherUSD
# forge script script/EtherUSD.s.sol:EtherUSDScript --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY --broadcast

# ReceivePayment
# forge script script/Banking.s.sol:BankingScript --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY --broadcast

# Drex
forge script script/Drex.s.sol:DrexScript --rpc-url $RPC_PROVIDER --private-key $PRIVATE_KEY --broadcast
