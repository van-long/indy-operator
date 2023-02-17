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
Generating keys for random seed b'b8e72Eeda8FdC61312fC913caB74cC6b'
Init local keys for client-stack
Public key is EBcWmmCLJTwEErjYiyKLjGVaJktCMyHYuMAA5cJ3Tx1U
Verification key is 6MsSatxEYW47ZbtLyGK2oTeRX4JDdVnT5zs8ccaqxxGa
Init local keys for node-stack
Public key is EBcWmmCLJTwEErjYiyKLjGVaJktCMyHYuMAA5cJ3Tx1U
Verification key is 6MsSatxEYW47ZbtLyGK2oTeRX4JDdVnT5zs8ccaqxxGa
BLS Public key is 23r4UVDYd5rdD5rsbDf5Nhm2mP6ZT9ZEDoz2YgurJYF8y4PUtW1hixdjKdm3KuoHEH19jULkRnD9QRxd3dB8NA6qpXzjkyembqHtc22EkFsuYN37wj8Ft2kDDCU8DA7ZvY3UnnHowJ7MNfxJAmQXJepb3oNZbPdjFUrNPimbaytUSLM
Proof of possession for BLS key is RD7LF4gSdakx2rehDXowEA1EE8Y34WNBDfghQfXVqRfBENeyDqkBiPJYj9pmwrcSNqnqqEsTgpM4hw7McCqX2JqRLwAKnaWAviBYgAjD7i1P9NPY4WjAWcwYFWGh8guSbpBvMzUnfErG2K2FxbkBFmz9Esfs2FAq4AyRphn82d1GyM"

node2="Node-stack name is steward2
Client-stack name is steward2C
Generating keys for random seed b'daE35FAeafDBb2Bb54DdEc97FDB4987d'
Init local keys for client-stack
Public key is 7WrJ3BkgbMjuSR6e8PaebUqTd7pTeXgsqkH17sfwKAti
Verification key is xcZxQPb4brZnktLACY4TJrUu3QmnQjNrQEusZjWX4r4
Init local keys for node-stack
Public key is 7WrJ3BkgbMjuSR6e8PaebUqTd7pTeXgsqkH17sfwKAti
Verification key is xcZxQPb4brZnktLACY4TJrUu3QmnQjNrQEusZjWX4r4
BLS Public key is 4gyjHvh4VTke7tFg9beQRUaKrmg8MQdEZ4vZvN45zHFxoveLoWhAvnehjRzYftTmNYJfkv5srqzmhqkm9dLsWusQ8qdATLA4fzRkxy2PyrePqDgbV4JHRZaWhxnZQQY9DejovkVMrTzS3NdGqbQrENj1JHnDgXbmkFFyGY72Ph12w3y
Proof of possession for BLS key is RWxr5mJxzznKhcFM2vcPaCUHMCN6SzgYH3ksTqteB57sFLa6bcau8A5MHoem5gzYrans7SZj96oUFLZHegMqBWkn437GwTcqPTGszXfChTw679q5EeS7vQt2YhYHMHe1d14U7cmPqmUu5zYE4cdeADBdZuZkmfB6z4ZS84gM928Bc3"

node3="Node-stack name is steward3
Client-stack name is steward3C
Generating keys for random seed b'c8a93a1CbCE7b5Cbce27B1f83b1cc2A8'
Init local keys for client-stack
Public key is 66ouiuJiUkRgRxssKUYAUj2vaWQR5khTNX2z7SKBjFG
Verification key is 3gT5DX8bkeSFgpGNxwUJctuNDZAwKqkz4PYQBWVmcPFx
Init local keys for node-stack
Public key is 66ouiuJiUkRgRxssKUYAUj2vaWQR5khTNX2z7SKBjFG
Verification key is 3gT5DX8bkeSFgpGNxwUJctuNDZAwKqkz4PYQBWVmcPFx
BLS Public key is tFx1XAp7jpFTmfNfRKrkBBA65ZsP52bA1ptKGL4yAdPWKKTbcQBN5121nSUTrQF4qpBT3Hicxhob4MxuyHxbEJwyJ6QmPpr3z7aZwKcHhofe3h9f71mELxaNzviSzbZRW1FoTr3gQ8XDwQhsjDXFD2D579pW3F8Zk9csemPU8avrXV
Proof of possession for BLS key is RUYZWDepV9mhUnmRuMXHraHoYkNQDm7GTchAGMYwdy15j3EnPKEETYgKHkcUupcjN87vZGoDBksn62EKJiuwRZE7KEXEXX6xBUffTvVgjvPmQxVpN3PVte6bZ98tfs4WQ6CAUz7PohA683FVB5BjRPX5w6mekVcfMmqttfzxhdThNF"

node4="Node-stack name is steward4
Client-stack name is steward4C
Generating keys for random seed b'Be7BF88Fb9Aee3774bBee99DA680bB7E'
Init local keys for client-stack
Public key is 57s6Ntkn5RoYGgJep2UfxpFmLDPjZT3QH32CupD64JPP
Verification key is H9mKFdCiJnjXXGgupkp6CJqDBpz2YHir1DQDxujDqrA8
Init local keys for node-stack
Public key is 57s6Ntkn5RoYGgJep2UfxpFmLDPjZT3QH32CupD64JPP
Verification key is H9mKFdCiJnjXXGgupkp6CJqDBpz2YHir1DQDxujDqrA8
BLS Public key is ua8UKfqMTAD1L2Pq6tULGmjxMeJLzoNAYT7TrHuPFrGzmzdhKK2zfhggmyNhaBNMDCuhqPXZvV4Lazg7znooTvqeZvKpdGHb64T8EYe4qnnSAfc3xc5fLoneUQJotH9roXokACdQfcWdpGy32eRb1d1SUpFqPxDHB9CDhWqzM2E1Xp
Proof of possession for BLS key is QnRcbXuWVoKUJaRab79A9PVnFD3aQM5pP4FzPwSzd4qaSnqGfVHdzgz6NaPG2JwjBfZsrpfUh1BamNJFy5uk6ws5m1Qsh3EqRaMi6mRMedyk474VPTMTsLRysiUYbBoK7uu45JBEYuVP5bi62vdkN7ZUcQLiNvc79XFjqrfACpGf27"

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
