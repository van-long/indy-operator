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
Generating keys for random seed b'3dC746f2e39D6ECFbb75Ee42Fc4aC16E'
Init local keys for client-stack
Public key is CRe7u1TFeqneYNxNfHReMANNrfabZLn4pdPhDiFSnGN6
Verification key is FCsu6GQ5tmya43pPhuynQGfZUZtyGwg6PEVTuyWiS7Pv
Init local keys for node-stack
Public key is CRe7u1TFeqneYNxNfHReMANNrfabZLn4pdPhDiFSnGN6
Verification key is FCsu6GQ5tmya43pPhuynQGfZUZtyGwg6PEVTuyWiS7Pv
BLS Public key is 3HzPqURuPuGxzm8ZdDvpXAyX4t8EtH3HttwYSJ9YFCTmyDK4RX8KEuqn8k7F6zumBmXoNk3AQY8vQBMYc7hSnKrG38k3yFmjEv2xSF6ExzY9JHRVApzL8to7UFnMc8P2zXeGGw39csBLEM9fx4f3W2s31AWzr2fbhGGZfHmo1Y86zJV
Proof of possession for BLS key is RXbUYyNhuYk1sSt5XANMxXabXX4nauw5SPX6EESmS64Wu5khQyFyiQ6ybk6eswXRoCtLubLd78VgeUmPKc9FpTr5p39wiNuwXzdcSXhgiPwUVgjZU66nqxehouGjHEyzpb4S1oTmuSJ7w75CQq35caR6cew2gR9oiFxwiu8MJ7uW2K"

node2="Node-stack name is steward2
Client-stack name is steward2C
Generating keys for random seed b'5Ac5eDd408F104a879b4d02192E1bBaC'
Init local keys for client-stack
Public key is i7js5AeMsUrASKa4FxNr2hSsTrJaWqkpUxKVZcvjzRT
Verification key is FQBh3vKdPwuxR6em4dqjtBVkQKjS5r7or41LSafbWfya
Init local keys for node-stack
Public key is i7js5AeMsUrASKa4FxNr2hSsTrJaWqkpUxKVZcvjzRT
Verification key is FQBh3vKdPwuxR6em4dqjtBVkQKjS5r7or41LSafbWfya
BLS Public key is phKk1itmnitkwXaZnXud8wsHJcQUCpEMYnCfyrP6YvHgbpPwiwH3ZvCvsTXdRxyHkBR6NAPkKNJYKiCASYPbbPERMoEsCQUozM73moao22y2HYHrdD6KuEZmNjWHfiw5aY3kN3CwnZLQL12bCuHBmR7okMCrGrEJCbq6wZ54PH3czq
Proof of possession for BLS key is QsRM8po7UYVXUsCpaQaKpdcLXHfsfTxrfjevWUUBcJuF4bQYzSPeeTQ6gNjF8zaiQhmrdwLW1Lz88X1UsNFWEp7dQJxn7hHZ8HU5Vdt9CVRDtTxC5ZJDhL7pLdWXDQaK7XE5tSpa3RfLkaE3nUuDRAg9qYNY2JAB88iNyHbygwTqR1"

node3="Node-stack name is steward3
Client-stack name is steward3C
Generating keys for random seed b'caaD1E5944fd5BAf4d0bCeE646dFcbf1'
Init local keys for client-stack
Public key is 4YPf26wReHEsRKzU2JhRYrrKCZAAx4TwRegKEwksYLbr
Verification key is 3x6xXR89rcWa2iKW6VJybuZXt2vDSs2iPZwqDXwtdNtc
Init local keys for node-stack
Public key is 4YPf26wReHEsRKzU2JhRYrrKCZAAx4TwRegKEwksYLbr
Verification key is 3x6xXR89rcWa2iKW6VJybuZXt2vDSs2iPZwqDXwtdNtc
BLS Public key is 3XAguTXdLEvhTxGzqqFPnaXLPy9kwgSnR5tL65xQVYtGG2pCCXxGw1i7ArWQyRiXbjZgwR6tLK2TAcFMszFGxE3PeVazK7RdhwF3YaoREhPXVvDcVSXoVnTxkLTdA8TxvX68A9FZSG5N2rRm3mhyRnEoaFma8A9DzndYcnkwFC6syfC
Proof of possession for BLS key is Qr738DQUYJ7tAgS4S8M5J8eNZup3tLauyWgcyVyGdBNDakby5u1PhrPPbcc6PRVazSksoMy8R6wTRat8wFhh6NjqjQMPFkZ9tugHtjUKDnW4WQfDNFjjKtza9QuyZaHpkp5iHYv4jeFq7Ljtxbd4gc2WF5b2ubqhDGnLhskzMnrQTh"

node4="Node-stack name is steward4
Client-stack name is steward4C
Generating keys for random seed b'E9133a78DD0f4BCBE3F842B05CBdE98c'
Init local keys for client-stack
Public key is 8QWcFHj6UoHy6vsRWgnWjgTc3M3cSF5yTJsBzEgma1K2
Verification key is 89NBnRfWXQsfssQs1DByXGBSyFJeFZ3wqa8zbeXeDfCW
Init local keys for node-stack
Public key is 8QWcFHj6UoHy6vsRWgnWjgTc3M3cSF5yTJsBzEgma1K2
Verification key is 89NBnRfWXQsfssQs1DByXGBSyFJeFZ3wqa8zbeXeDfCW
BLS Public key is 2ijvhGCtr2kzmPBWyUnd4B78F1e84aYYfT4a51RJNWUEb2yui4QFBkiVmj9g8uNrxyAWEer2Axg98XWiJUL9ZhEZ526o8aw8EkxUTJnemjg8ZBJHnnQ85hTTLpiDQTivSGXbhoweLebYFtK4u7xFoK3jN3mqqe68ApXxNq1DUsjRTkR
Proof of possession for BLS key is RWAH4MRFYUotmtbzbghTRb57hpLLMVUhcF9drog9UXWGK5Uu2aFi5vxwb9671ePkhZXzqByf2fq3iDJToyvbbZzHuQLjy1MZGdNJwrpwQS2s58jR8Rnc1m3owFUafV46RASnbDDwjZwzdjYHjFEMhy8K3DfwUeh9iKevtVBqCEV7AF"

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
