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
Generating keys for random seed b'aBB9eA8B1Dc5e3CcCfD6C2d49Eb59B0f'
Init local keys for client-stack
Public key is 52JpdGkmM7tuhJncDfdDtC1rLK6KrJ1EQHoiqZKigaHN
Verification key is 9HrKdNjBkzsZMGEW96ekDGyneZPTm2nJN84a8vHvu38L
Init local keys for node-stack
Public key is 52JpdGkmM7tuhJncDfdDtC1rLK6KrJ1EQHoiqZKigaHN
Verification key is 9HrKdNjBkzsZMGEW96ekDGyneZPTm2nJN84a8vHvu38L
BLS Public key is 3quq457bgwEDUryQG5wVk6BzKg8X4DFuU1yhoJpsYpLCf3n7G2FQdj9zqoecZavoGzsZJDydruzPWnnCWdzN1f1JkZ5gm8njoBHxcxLjZEJApi8RTHdMWoTEgPSrY6cwQ8HY8jUNoBrzuFmJZqNrWypGfTzJncwZ4s65biYZuhSmaWR
Proof of possession for BLS key is Qos8ctvSKWzDoHnb8xS2DLoB9y5PFPQ38bdXhzqLsmMbGX3swZ1gYo9U28yyZvVvoYRLDdqyGpjWY51eSe4z4RHf2QY3ekGKMZPwrAThUsZErYSZzDPmXaQmTYvDPTxBeH1PGAygay581xvZmayqeTGBvHiW41Nz9nrpiwVyEBov3h"

node2="Node-stack name is steward2
Client-stack name is steward2C
Generating keys for random seed b'BDD0D14dEfDEe6B0aA7d12A306a0b1cE'
Init local keys for client-stack
Public key is 6iNSzThbi5NpMmGRjRUXS6S1bu2x7jDWCJ6HrSvKtbVS
Verification key is 6jBCgJz3opRqfRmonoHooUcbd2cgQwrDrhnvGFae2Q7X
Init local keys for node-stack
Public key is 6iNSzThbi5NpMmGRjRUXS6S1bu2x7jDWCJ6HrSvKtbVS
Verification key is 6jBCgJz3opRqfRmonoHooUcbd2cgQwrDrhnvGFae2Q7X
BLS Public key is 4JTCzdvW1NWrNjUAcjeYrFLwk4DJ4nWhaPpA5o1PQgHgVqhPGnUG2XdRiFp6bVSKvFyxfLNu8jZBe5C1BVmA9wo7C16tNSidYfNMnfXX6kiqcZrjTo83cfvb3U2rEvEP7hnBaUmWArgpR3kRMFU1sCdY537SVrtqq2gPnSVEjPFjzr2
Proof of possession for BLS key is R9PPGkGhBkNKQYKATF2neET4VxrUUPVHLc6uu3QWJF6nDCR4tt76Vv8j6yFcJ6SqLFLcqqcY79qaF44WF73T1Lf5GUPZ4KR3SeuhfkmTe4RU2RjaU6NYfxiNW9gwxhBPkX31AZiN1nxxynu7zUaQfVqCLKKF5eSPhiXGeNYjgzNPWX"

node3="Node-stack name is steward3
Client-stack name is steward3C
Generating keys for random seed b'0BDA3bBFb9CDddA53dc08eA3754A2f5F'
Init local keys for client-stack
Public key is GHvD3EJguCjZTk4YEV1cgaTsa5Y93jpm5jAeDAf3vGg6
Verification key is E3xcR7iPqvsHvQdEPTPm1PgHjsMHLJ6fpJQywpdHNYJi
Init local keys for node-stack
Public key is GHvD3EJguCjZTk4YEV1cgaTsa5Y93jpm5jAeDAf3vGg6
Verification key is E3xcR7iPqvsHvQdEPTPm1PgHjsMHLJ6fpJQywpdHNYJi
BLS Public key is 4G997ueEsQDkpXteKKszsdT6ezbCCHzRw8YVrf7PxyzSu6JDC4zgcaGw7m6Va3oWJLeoAaV7hJAhRpa8h3wMN2GLhdhFyXHsAtwQSY5pEAKefHdFc3AoDWUybzxFq8gtXZu2DGmd1HUaVbcwrDQ1fHiWJUUX2iJN4F5QFFssP7n3aSn
Proof of possession for BLS key is RQv4pFzCCQjDPVR8EvNy7VYrsefQoBLurZpoExThH6nKjBCdgLpsv3qodhkp4JYGbag1EtkQ3i5dYoSxLAbcese6oFPdh2N6kEaSSYZQdcyjmhhranPmTesCbnV723QH5LSkWv8VBW7PNbu3GkATd6EaTYgeeMF22YWGbDaWusAqeP"

node4="Node-stack name is steward4
Client-stack name is steward4C
Generating keys for random seed b'aec67D1CdDb40068c6B43E56892CfFfD'
Init local keys for client-stack
Public key is 6FxCMZW5RH3smsfnJfJoUDjDZxwmezKdmx7JWq67Vz54
Verification key is BTVGrEiaJyrw5xR5soU3UfTh1dPv7upcQn2yJrBxtr3W
Init local keys for node-stack
Public key is 6FxCMZW5RH3smsfnJfJoUDjDZxwmezKdmx7JWq67Vz54
Verification key is BTVGrEiaJyrw5xR5soU3UfTh1dPv7upcQn2yJrBxtr3W
BLS Public key is 38widz9PAvVCWmQa65p4HM5q5KH2sosGxNvctwYmwr2pURaZeRGjD7n6c6SfzXegSd2jGweDP4JNKeB3dk4mksF3Ch3Woe7jJuZYn1g5BiwYnNcywSNVoRJSGv4nWuKhDd69J4Rgq4kge7oWQLBTzU5cqYxUa1fasKu4HQDmJjNiMqV
Proof of possession for BLS key is RHsn1Notav3dR8rUGnuPzCAs1vWJtNQaw52mmWEGK79KXg1ULDQUBFvX2NgH5tVkTHJw9dqYfTHRXDEMAVZMQpsAbYYkJo6hUCbrRRD4Tix6bJby1MDXAh3Brc9zmA6jotCrnZjaAeLuVGGWUMWgQ9LV4NJ37kbP6J6d598ZrKMi9D"

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
