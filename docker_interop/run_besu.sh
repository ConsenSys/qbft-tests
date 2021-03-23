#! /bin/bash

NODE_KEY=${1:?Must specify node key}
P2P_IP=`awk 'END{print $1}' /etc/hosts`

echo ${NODE_KEY} > /tmp/prv.key

besu --genesis-file=/eth/besu_genesis.json \
     --logging=debug \
     --discovery-enabled=true \
     --host-allowlist=all \
     --rpc-http-cors-origins=all \
     --rpc-http-enabled=true \
     --p2p-host=${P2P_IP} \
     --node-private-key-file=/tmp/prv.key \
     --rpc-http-apis=ETH,NET,DEBUG,ADMIN,WEB3,EEA,PRIV \
     --bootnodes=enode://b81c7d5207f96ee4239ba7597798f1e1ec6db494ead9aac0a55836b75bf8580cde01c577e406de12c057de23411e5a9fc723ad6dcd2e75262cf7d04c5613b9c7@172.16.239.10:30303,enode://c6cd164524a7f80bd02f7b3d7f61aa6f052e1be36ffe5655944281fb5999fe59a3551d52139cf7370111001429d965e1617a4574390e5eab8232dd15bcdfadd0@172.16.239.11:30303,enode://4daa1048a351545279fb851bd123b2f396592733a56e2fdda399c1892f0debab0e338e88d4e62e6445a94df7dc62776c55bfa0ecccfa2539e722496e8190ee65@172.16.239.12:30303,enode://c1599da6b1f64e24f872e8bdd1835750446b38cdcc66dd93ac4d0566409b39b188dd64dd4529eaa17ce4acf9c3286047c5736be44095c0c5ac17998e49cda986@172.16.239.13:30303,enode://e3c2670260d8fd8a7d7892a8244e88a59b3ea757443084d782c290350da71c9d3dec0832d8478709b589bdd94a69c29dbc3932a1f7cb54f1b9cf23a469259e6a@172.16.239.14:30303,enode://5ff0d5c853281a0ca02fafe8f11164fef42bfd3c74199151885094792f37c7cd3a42b76e4361545e024e0479c9d42c1cdcb4952779be9b147fb9e674e22117de@172.16.239.15:30303