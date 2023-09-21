#!/bin/bash

DATA_DIR="$HOME/.artelad"

sed -i 's/127.0.0.1/0.0.0.0/' $DATA_DIR/config/app.toml
sed -i 's/127.0.0.1/0.0.0.0/' $DATA_DIR/config/config.toml

echo "starting artela node $i in background ..."
./artelad start --pruning=nothing \
--log_level debug \
--minimum-gas-prices=0.0001art \
--api.enable \
--json-rpc.api eth,txpool,personal,net,debug,web3,miner \
--api.enable \
&>$DATA_DIR/node.log & disown

echo "started artela node"
tail -f /dev/null