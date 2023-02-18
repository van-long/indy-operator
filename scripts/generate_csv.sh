#!/bin/bash

# Using: docker --log-level error compose Seed: MPHRnFAd7yjGcJQd9xT0M5Ix22c/fbu6 DID: XiojAukDFg7ZYf9VYb85ud Verkey: Hk9PZDn8rAJUVruHzZtTfLy5XjgZZMDt5CDkFSX5zpPK
current=$(pwd)

cd $1

echo "Trustee name,Trustee Seed,Trustee DID,Trustee verkey" >$current/csv/trustee_secret.csv
echo "Trustee name,Trustee DID,Trustee verkey" >$current/csv/trustees.csv

pat="Seed: (.{32}).DID: (.{22}).Verkey: (.{44})"
function getTrusteeDid() {
    trustee_name=$1
    trustee=$(./manage generateDid)
    [[ $trustee =~ $pat ]]
    echo "${trustee_name},${BASH_REMATCH[1]},${BASH_REMATCH[2]},${BASH_REMATCH[3]}" >>$current/csv/trustee_secret.csv
    echo "${trustee_name},${BASH_REMATCH[2]},${BASH_REMATCH[3]}" >>$current/csv/trustees.csv
    return 0
}

for i in {1..5}; do
    getTrusteeDid trustee$i
done

# Generate Steward keys

node1="Node-stack name is steward1
Client-stack name is steward1C
Generating keys for random seed b'33AC5960e652caaC0E224Ff3D0ac3474'
Init local keys for client-stack
Public key is BywaN1WHQKMDT6NkPexnUHvGjiPKcK1GAzXWy9aKwMUE
Verification key is GqVaKvrFEvyj5ETuupoVoVm3GyjyrKH6xn3qNTg8yqgC
Init local keys for node-stack
Public key is BywaN1WHQKMDT6NkPexnUHvGjiPKcK1GAzXWy9aKwMUE
Verification key is GqVaKvrFEvyj5ETuupoVoVm3GyjyrKH6xn3qNTg8yqgC
BLS Public key is 4PmB2arSdS1DQPAAxe6JBLNucHwaoocQba9voLw8pAfYv4KQzs6HAd451Q7LpHWiPns2BytY4sCEU6jLjWJ1fDhhU7jzhYVAZy4hKrpQNqh4swaCdHtPovrAHiUdpoW6fCwCpZxx121Yj3yi4vHk8N8G8j4d1cXWkS9duNTvuprjNjj
Proof of possession for BLS key is QzUsmaTxWnHLnLaBkTG4Ms7sfWNBbfthv8KRjuSpTScFpzT1Yomc3t425NwzxwFZrbDXSzV6ss44GzAQuPuJ4jtr1g3W9nvXHuBve1Za4GzDWAkvsdAcJUhkCP7tN852KLUSkfgZbeXGspBDkVBo5Y63YZ44nWZH5MX5Z5Aa5Zkwwu"

node2="Node-stack name is steward2
Client-stack name is steward2C
Generating keys for random seed b'DEe6D4D5fdA7CF05413A80e83f4aa65A'
Init local keys for client-stack
Public key is 7wRZHK8xZFuKsDZdKVLp5Y317NQCSJNVc19WsZ16rZbh
Verification key is FZyn2i3oeWjWtSXTJtcXcwa9GLa4ipahTMpGkso55DrQ
Init local keys for node-stack
Public key is 7wRZHK8xZFuKsDZdKVLp5Y317NQCSJNVc19WsZ16rZbh
Verification key is FZyn2i3oeWjWtSXTJtcXcwa9GLa4ipahTMpGkso55DrQ
BLS Public key is dbk5ym7XxWfFM76EyPDkT3CV3yvXpStvg5JbkD1NRPcbSTFbeaqEV2xqRbU1yDtTcNwGAtTNKYyzbUz6ACNaBEpd5jxCBQvuekEwVZwS1jMkLwCvrPxt1HYwJc19WpdfoKjPgPYNwMtXMuz6FHSzKPoqkkXymwqdvRdiyFrANbF9XQ
Proof of possession for BLS key is R9NxtpMWsmScWNUCURShzjyxZzLNUHrkELvijpVY9JLwh8GEGBqAwPGsuWFaEFwNK4MjDUxtt8BicgpK3bYD9e6RQEjJPJjy9azR3rVWjZceQZwCBNZCnVGGPuMFhsR4CvjgmaQ7xVZWXREUCcQqAmdyyFyUufL9Wkwhi5WSTDUsEF"

node3="Node-stack name is steward3
Client-stack name is steward3C
Generating keys for random seed b'aCaBdE7Baedd302cAAaBfcEAfFF29Cd1'
Init local keys for client-stack
Public key is H7WRYhK8UKbREqJrLCvdVJoX9MmYKVGQf7TW6FCR3G3P
Verification key is 4t96sapkLMQHeWue4TQbQzN1ZmkR5GhSpfcdj8NPDy7p
Init local keys for node-stack
Public key is H7WRYhK8UKbREqJrLCvdVJoX9MmYKVGQf7TW6FCR3G3P
Verification key is 4t96sapkLMQHeWue4TQbQzN1ZmkR5GhSpfcdj8NPDy7p
BLS Public key is 4JZJbx3SMtB4jfo32LfwrqnbuZxqUHaCVPZZQB3TSCkBqwtuHc4PcTBFfthUXRpMJrXUqUMFbZC2tNtCdMqasB9EtEqeW8HRvcpHyiX4rhvNQXxzfGfVqw7cpWAKUd3jzDuaUD8ti96eKkwwVTUf2z56yYjHByiSHS5J6Dg4da5q5Rd
Proof of possession for BLS key is RL4ftUsWb21AXfka49RkxRci6xSSzysmJZGKhEg3cxXXCi3Nqoq45w9XFKEzY69RzDH7KGrzCLWsYYWvjeuPsnaC79P1DiwEqAs4gg4mivTTtRbfNcGAREwBWEViRBa4W74sL513xi4L3X61S6SS58imdZh6JJPYHx2qSuoTvNdS9V"

node4="Node-stack name is steward4
Client-stack name is steward4C
Generating keys for random seed b'41b346485dFf7Ee6C0b258a9Ee19b48C'
Init local keys for client-stack
Public key is 49qW7b3VcnKRm952Q1VaaJx4svAoLRMzJVPKHmoNPzy7
Verification key is BPGQXdqqvCd1655EaDRhEW5w6pMMwLQmWpNCKqVtN4YK
Init local keys for node-stack
Public key is 49qW7b3VcnKRm952Q1VaaJx4svAoLRMzJVPKHmoNPzy7
Verification key is BPGQXdqqvCd1655EaDRhEW5w6pMMwLQmWpNCKqVtN4YK
BLS Public key is gr3ayYySeFrBKyvVDhvFeA8fPWnBnMWcTaCyVCH8qAgkku9ZJpeT2qyghLtyNbsvVbibVmZN81fCnx5oASy64mk3zN5QE9wn7iWmGL1htRQmZV5KTJC1vjQhmSB6LwG1UBPaDnQ7y9n6MKC26E9kdCf3KYyXaaxxAide2vg8oBGYPh
Proof of possession for BLS key is RQRNGuD6DQVXPKJqU2KvEojDRCmLQBK4HCmHJw9Ys3oMnwrz9hy3Hik5mvL9iDiMXFPgZn5HNGrRz5H25WGUtyFV5o4oarQXVDuV72ymYgaUwEfp6TxP6Hp2Yfkbr4brpW4xKPKAkHbJv39sHBTnAipkQvRDaFQmZJNVgMqj8rKDGj"

echo "Steward name,Validator alias,Node IP address,Node port,Client IP address,Client port,Validator verkey,Validator BLS key,Validator BLS POP,Steward DID,Steward verkey" >$current/csv/stewards.csv
echo "Steward name,Validator alias,Node IP address,Node port,Client IP address,Client port,Validator verkey,Validator BLS key,Validator BLS POP,Steward key,Steward DID,Steward verkey" >$current/csv/steward_secret.csv

steward_pat="Node-stack name is (.*)
Client-stack name is (.*)
Generating keys for random seed b'(.{32})'
Init local keys for client-stack
Public key is (.{43,44})
Verification key is (.{43,44})
Init local keys for node-stack
Public key is (.{43,44})
Verification key is (.{43,44})
BLS Public key is (.{174,175})
Proof of possession for BLS key is (.{174})"

function getStewardDid() {
    steward_name=$1
    steward=$(./manage generateDid)

    [[ $steward =~ $pat ]]

    steward_key=${BASH_REMATCH[1]}
    steward_did=${BASH_REMATCH[2]}
    steward_verkey=${BASH_REMATCH[3]}
    echo $2
    [[ $2 =~ $steward_pat ]]
    node_alias=${BASH_REMATCH[1]}
    node_pub=${BASH_REMATCH[6]}
    node_verkey=${BASH_REMATCH[7]}
    node_bls=${BASH_REMATCH[8]}
    node_pop=${BASH_REMATCH[9]}

    echo "${steward_name},${node_alias},${steward_name}.default.svc.cluster.local,${node_alias}_9701,${steward_name}.default.svc.cluster.local,${node_alias}_9702,${node_verkey},${node_bls},${node_pop},${steward_key},${steward_did},${steward_verkey}" >>$current/csv/steward_secret.csv
    echo "${steward_name},${node_alias},${steward_name}.default.svc.cluster.local,${node_alias}_9701,${steward_name}.default.svc.cluster.local,${node_alias}_9702,${node_verkey},${node_bls},${node_pop},${steward_did},${steward_verkey}" >>$current/csv/stewards.csv
    return 0
}

getStewardDid steward1 "$node1"
getStewardDid steward2 "$node2"
getStewardDid steward3 "$node3"
getStewardDid steward4 "$node4"
