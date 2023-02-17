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
Generating keys for random seed b'9e906804efdBCFf65C51A2675e80C9EC'
Init local keys for client-stack
Public key is JDVa5N1rL6dV4Nq2EeC2KyCTmqZvyd7GPL2oQ6AhP3tm
Verification key is 2nVWqdVLGaG58DCcJYLq2GsLaJtkye4QzgNQ58HSfZgy
Init local keys for node-stack
Public key is JDVa5N1rL6dV4Nq2EeC2KyCTmqZvyd7GPL2oQ6AhP3tm
Verification key is 2nVWqdVLGaG58DCcJYLq2GsLaJtkye4QzgNQ58HSfZgy
BLS Public key is 3eYZvr8M6FUxvoHjsohNbcWFpnHi6HW9eh5ZJ2rw2FcVGjYz1PnxDWdrHi1sp3pFASem1zgPp8zkQrSDUmG9NzJGRyEkJwr3aUA61bM8ioCDzQL7FCjThq1UaJUpirymb4PHQEPL1xNBsVtfg5zLNzBZkRGKv6MwtdgyGkyebw1ZrZg
Proof of possession for BLS key is QxM5T3nLfST1ToVy8BHo9tMHjTRkFW7XNFpmjjoWkWu8jvWPJFssgCNHi4AnBgkbe5KDA86ywuLrhwtNDeKTr6rXTatWYHp217BcbzXvm9p9sN1Gc9CnW3vDtU77euGheVZeMop6vi2XwfbHCesGjGVDzAnEpZgCvwZzDRJAhy9jtB"

node2="Node-stack name is steward2
Client-stack name is steward2C
Generating keys for random seed b'aDDed1dCECcEf2c975040C78fEC4a3Be'
Init local keys for client-stack
Public key is Fe2VLd3KDdVGLdmpTA47pGY5utjn4EuW3n9YFbZ1bGGD
Verification key is DeE2fT6oe4BQzqUx1tjD72SySdbRNNBCqJjLrj4BcbAq
Init local keys for node-stack
Public key is Fe2VLd3KDdVGLdmpTA47pGY5utjn4EuW3n9YFbZ1bGGD
Verification key is DeE2fT6oe4BQzqUx1tjD72SySdbRNNBCqJjLrj4BcbAq
BLS Public key is 2vc7sobGXzGPYQ2zRSKx9NtcgKv4fuNiwYJCkHDgec7o6D6jobP4eSKhnEibSk4WHd7Kp9hvKoh8QvHDZSCXwqNwhGBW12ajfiouukLABrenQoFixMsA6tCpc1h13aWyq3dC9FMRNA34r5geAX7B7zC427qiZp9GponiQD7Fn7BihqU
Proof of possession for BLS key is R3fdwDhP1Ffhhir5Gns8UPUcBTT5273E3ywWph6kV7c1UxCWj1ihKPA5MBaTEJZeCQsJStn4rpcCCyaqd4d7dW7VSzeguSedb1W2aMM857Lkbf6WZX5GD34HsMfV6BmqFmVCWdx6xiEJLMgtRA1Cn74W7E1yqseCNN33AzShxdzUF1"

node3="Node-stack name is steward3
Client-stack name is steward3C
Generating keys for random seed b'D18cca57ae2AdE68cfC89cf912FE1ABE'
Init local keys for client-stack
Public key is 8JfvvMYVis9PgaqpcVYkGwNBEXWhyYSbVyfDwEZnatGy
Verification key is Hci99me2FxC7ejLsdE56qXqT4V4Hwe6vfTJTwMDpN4cp
Init local keys for node-stack
Public key is 8JfvvMYVis9PgaqpcVYkGwNBEXWhyYSbVyfDwEZnatGy
Verification key is Hci99me2FxC7ejLsdE56qXqT4V4Hwe6vfTJTwMDpN4cp
BLS Public key is QEGoAHv2smPS3747PNntSPQzZCbzwpLdTwZQDnCgDK55DZS9eAHzwkfNcZcGFcM3CRGbbAqQcqsksbhjMTFyaiqaf4FoM8ZaHmxGKrRs2VD7iSqSq3K3ZzLW3TV2iakPvfFQw6rzkwRbgCEiwCXGkt9Mrz73vLvm2x1WixFrwDgyEC
Proof of possession for BLS key is RKVQEZFhMoJ2FUiBLzmR8cGabVDXc8xt5KTeaGKpgA2JL9RLRTX1i3DYSAnhDB7Lmr6CLBrxYuADYJbmw2bGLLs9AT3TCEQyfmBv13MUT98SaHk1jxFp42yuQZgCKXyD6EdvDSWvYhpGybiKnMvDSNn4fEkYRY1JT6HzXzHMEDeU7q"

node4="Node-stack name is steward4
Client-stack name is steward4C
Generating keys for random seed b'e071FaEA9c22Faa95d9FfAFE1deA8cB8'
Init local keys for client-stack
Public key is FdwzZ9HzTYM2RJmEoV78eUfcvDx1jwVL5B2uwif9uoco
Verification key is Ga49A8chvM5DhYoZTXAu5fqxyW8Gf5P4n2DoVZTVhc8c
Init local keys for node-stack
Public key is FdwzZ9HzTYM2RJmEoV78eUfcvDx1jwVL5B2uwif9uoco
Verification key is Ga49A8chvM5DhYoZTXAu5fqxyW8Gf5P4n2DoVZTVhc8c
BLS Public key is 3SyMQkfyMawqJec1Bczx6fSdSnkcQWmVgtqDppyaiGdfm21JFK1qV2vGXhcpUeomM5v68bTTzfWPhMepCfXkE8UZJuHxbktgGE9DrSV5ej6oX8jiZ3YASRBpUD1fbcvzb6tW9Z8rSEgkEas4RwsyYojswR23mt6QUH5zgCVGYneA7C9
Proof of possession for BLS key is RZbdHp8e7UjPcQUyULEjCetyBC4RnfXkaKGgcfK75KYsxNMe9qF63AVBRPfewggqspB9uaKas2aYaCjxB7cASFL8y9fTngwJhF4ikRUxF8nJiWDkYRRM7wisu85sp8b1DzbJy62w2B2hTNEWQWpfJ7SBCkAuABZ9AzMhpHXTaTJYrb"

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
