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
Generating keys for random seed b'5AAD09B4D53a37540ed7de67870ADd9F'
Init local keys for client-stack
Public key is 5u8EuBKRURFXL6mQytuDVG25EGYpeQAZQaXNCsPVwgDW
Verification key is C4rvXp3faKKrGnHczAx5P6ELaKYhmy46mSJZfgAbqCmF
Init local keys for node-stack
Public key is 5u8EuBKRURFXL6mQytuDVG25EGYpeQAZQaXNCsPVwgDW
Verification key is C4rvXp3faKKrGnHczAx5P6ELaKYhmy46mSJZfgAbqCmF
BLS Public key is mnazX1osYJ2Tt3YMvyXdoVAQEvwFE6gpxJfkg8guFAokNpWxZ7Ae8DAUnMctWxGjcexFSjUG81jFGHTaCYwuMq2uRd4xY7t8co8CCPNe36NFgYVuiQByqAywRZBpBLbJXo2Nw1j9MxgewKieAQ9NNTWRrnmzuWCevR9jcLLFqKAEUf
Proof of possession for BLS key is R4tvD7pQ8hZN3LKYDuU4HR3MpVUqwE1QPCxcvaC33Nhx3L5g6fEA18SR56GN1tkTQd5vMjDhRyHxybWozF2nNkEP1BReyNN7rvpBTCAXg7a1QcznjEAzxN83s64h54JwmBGys9jc7Y2tH8iXBdzVanMczFpioLm7EBtSYVjTtgGww5"

node2="Node-stack name is steward2
Client-stack name is steward2C
Generating keys for random seed b'EC1284cdB9Bfe16Ca8528025C8e0A6fF'
Init local keys for client-stack
Public key is 99CUE5tsWsYtLSr1T5EXvLvgRyG7cTQvt8iySzhzeFrG
Verification key is GtHasoVb92jwwRxmWbDATZb8k78bJbJkouWrusK5mQJD
Init local keys for node-stack
Public key is 99CUE5tsWsYtLSr1T5EXvLvgRyG7cTQvt8iySzhzeFrG
Verification key is GtHasoVb92jwwRxmWbDATZb8k78bJbJkouWrusK5mQJD
BLS Public key is 3fZFJbNnZNEtTQsDXMDir4JyXrbNezkr3qTqpgxBjigCjFoNDM4eqdJXdcBkXBjpNuT1DLXnAs4ewiLHJTqtddebVYU8FadffdqQ1LL2YpeUuU7fH59P1dc8W8Y1hxM9CyGov3ZNHKCGF4Fk21NzWP9mELmj5ahSqnNzCtpnrVxHhe6
Proof of possession for BLS key is QoSX4PS3nAhHs4gnDnFyeshUPxfD34G1esXBrAnHCQoB8DfrwQ5kQuQ1MohGjcp4wCNWcd2aPPjhJoYjFt1RQEZKX1J9cgLFAyKfTMoNtnvHiNhz38mrHNbMvM2bhAYXQ3xxptRESoBA4HNebtkP8SPQ56VZCJszXKWq2EheYaLoq1"

node3="Node-stack name is steward3
Client-stack name is steward3C
Generating keys for random seed b'dCA8F59E3d4e3C677bE43A103ac362a8'
Init local keys for client-stack
Public key is G5PRaJntBJzGwUcxYSBq3iDfLnR4KRqrKrjbjaj27ik4
Verification key is BrvW39H2JCVR7mgFstgeq1RCaAVMGUvfPyhvVFA69XVj
Init local keys for node-stack
Public key is G5PRaJntBJzGwUcxYSBq3iDfLnR4KRqrKrjbjaj27ik4
Verification key is BrvW39H2JCVR7mgFstgeq1RCaAVMGUvfPyhvVFA69XVj
BLS Public key is N4TN4qqpySm4B5PHxhZdjfDVQ58Jo9wrcuFCYSM6HR2MyVQT4tBdfPCuhEPDTQZcn1Vgt2MNPCJ2VKFx9SZH4WGYSxvGNWs6Uov1U8arsM1wZqeMWvEDB2Ta7X4ghw6tyfTHZWxvhkmeqAvsXjj4PrxNhKTn7wf3vzPBQ8mrRLXPDc
Proof of possession for BLS key is RYsrGwgsQsyPiJHocroR2Ki7R2s48E2d3TKsEqhtZrPs1aYo3wj11TEZdBGigXEvBxd6gBANfkwgw8g9NzMsu5oh1tdeiAK5gs5wJnFH6UiCzERABFs6TZUdhgxCZQ9B4FqbLdBu98hU3N7WMkVo245CG9UD7oQhxgvGTv3QcBn5hR
ind"

node4="Node-stack name is steward4
Client-stack name is steward4C
Generating keys for random seed b'eEBB2089acfE5BaC2D82fCAE6eeafC0c'
Init local keys for client-stack
Public key is HwfrnVGGqMeCpgqBBXWVAHUqL8qpL97GMtvgvZaAy2sy
Verification key is ATuqLoiHFSTzkQUtRAaK6WTnDxMqPgm7AMMu3svXoyuc
Init local keys for node-stack
Public key is HwfrnVGGqMeCpgqBBXWVAHUqL8qpL97GMtvgvZaAy2sy
Verification key is ATuqLoiHFSTzkQUtRAaK6WTnDxMqPgm7AMMu3svXoyuc
BLS Public key is FtGVjWt7dg75TEt2UcLsSPttx4UBMmed89copmBwxohTmmJxk6eTNxB9XBbiek7yEM3f8WLgDCTneJoqiyDKRzPfNYpMMY2qCvgzsKSbWLLeRixo2ZGFwyMpxstrn4nkgK4vyu6fhDFrzuBhTN1pZCjWdo9vWzpKpyYAcQAHqvxjaA
Proof of possession for BLS key is R2iALhiCCwqB8n63MWHGUbFR7xMZfu1Gb7mShbZ9zQkUc5uQ7dLg53qjgY9698dHhhhE8WuNEPjzWSHBSoexEgyziDm9rgfUTWD4yCZRCwm5yg6puQxrDScgUCHuw6ATBPJreqoMBosTrt9xwTALgVqG6yZwVoGpVPuAdTqJh6eMXD
ind"

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
