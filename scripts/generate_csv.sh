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
Generating keys for random seed b'B05Ad773d6cb2c2DdeC1E767EaA0D35e'
Init local keys for client-stack
Public key is GKhEsxewN9zgkHT8Yw11gz916ZN3VENnbkQZDxYN6d9F
Verification key is J9URhJ546VdmnozJgtvG5surifviGxNSbsdjnWupcpHU
Init local keys for node-stack
Public key is GKhEsxewN9zgkHT8Yw11gz916ZN3VENnbkQZDxYN6d9F
Verification key is J9URhJ546VdmnozJgtvG5surifviGxNSbsdjnWupcpHU
BLS Public key is 3WrmDaXEEFeXBFNBj5z9pJM8YMkzvKwXGiZfgL3UaAHv55iMykaTyApzjNMDycRcV76N3fRn1K93HLQPEcqUHg8DkSb98KoZEC5cKGL7szQ8w8NNmUSdUkyR91VS5nbhWdmq7HXHyX7wdG1pThwpfzJ7gYghhxG4KinQv6zUGDXX5Dw
Proof of possession for BLS key is QsUGJQKzPmm9ZjU85kTyrU8oHcLZWpMoA5nHYUgr9YGb6ErfDEGYdw39LdWAwGvZ6J8izegw1oJBQ7rfjqDRGdVDDxSXDPEuDrFw6CCy68RWQudxEHqdADnGPYS9KFmndM7m1KSg5mJJQjuVN2MLJLFFnQicpBpPRCS37Hvj5fVavT"

node2="Node-stack name is steward2
Client-stack name is steward2C
Generating keys for random seed b'D4FBBf2Fe3B3f2b78FAbFAF1aeCA27eF'
Init local keys for client-stack
Public key is D6w28SUqpU42tHT8Ch4U6JuYBYatMmM7Duv82w5dSeG9
Verification key is ANKwe3rSuBc9QkS6hGXVJjog44LyxDdy3stDvCWBFLCA
Init local keys for node-stack
Public key is D6w28SUqpU42tHT8Ch4U6JuYBYatMmM7Duv82w5dSeG9
Verification key is ANKwe3rSuBc9QkS6hGXVJjog44LyxDdy3stDvCWBFLCA
BLS Public key is 3AVa9BnjbueTT2NCj4XT2dkDoupYtBuCFjfTi6tWwqdgBa2PB393BiaDfqSGzrKMHjzZyHQENryDYmdskgaPq4ZzdQyv6NE33xfEX1dxtXyt8DQNVCfuSiRtJ5gbZ4uyH66vtrdHWh6sY4BeeDZgEjmAGfksCeiSiYgGchRs8YRgVVT
Proof of possession for BLS key is R6mKe3nxTgHyHPvC6dCEoUrWgkJhJ6oiDeQKMy7pbEEoQWE2Piw4Jk8o4jNjtBhCda7iyJY2zrMCP6eAb8W7rXrqqqQrJA9YHTYGn4BCGcsYBNSQ7uamkGrpPTjSxAAbDR5vGiQS1L6gXhwqE278LKM3Ap59MhyG6iKziEQUPVzecw"

node3="Node-stack name is steward3
Client-stack name is steward3C
Generating keys for random seed b'B08dB2B365A86FEe1aF7947BBecc7C2e'
Init local keys for client-stack
Public key is AEN6yxFPSzWLw7mk8Pm38VHstKLmdP7AWebVdBjdCovJ
Verification key is 5EMB1DqqF37ZVLDsFkae3ssKBgU1Lbbitpw6dbSaJ4wy
Init local keys for node-stack
Public key is AEN6yxFPSzWLw7mk8Pm38VHstKLmdP7AWebVdBjdCovJ
Verification key is 5EMB1DqqF37ZVLDsFkae3ssKBgU1Lbbitpw6dbSaJ4wy
BLS Public key is 2aAythRosUoPwwsaHEvWTTZDF1ZoH4bM9dU1Q4VRF1cT9c5NcTEvHgCPDDaKLdXEM7QCEqPBKEbqQqZEAxTLwerbzHh852f2JC8iKYd6akZyaK35WUBoPxTDonxJMjXoKvFSxS9k5v9GcQ4sJiVpbgmfRfnKTT4G4r237RYVS1GyV1z
Proof of possession for BLS key is RRwnXmTwiXYAUyoAHC2eR5HBwzTfhYNHYonMMnfaYho7cdRF4Z9p773W3W6hi7xb25PHbjzh976B4DtQ9cHxtgXXzpzB4ieCT6Q37jqmDybRPiuisFN4SaiA1JkxrhyrVsxDWcGYUi23aYRAP8zzSduSoumN3k4HCbJd5vgkdvTo7D"

node4="Node-stack name is steward4
Client-stack name is steward4C
Generating keys for random seed b'691be6501fca6B1798Ff25E5Fdc4df15'
Init local keys for client-stack
Public key is aUDYVZit1Veg1wVhUxCgzEzapB2jZrx6i6WZSpJUQ6e
Verification key is 38LvqLxa1UHThsREaRaLBDyuoCSe1e3h4W16YRTWDAyZ
Init local keys for node-stack
Public key is aUDYVZit1Veg1wVhUxCgzEzapB2jZrx6i6WZSpJUQ6e
Verification key is 38LvqLxa1UHThsREaRaLBDyuoCSe1e3h4W16YRTWDAyZ
BLS Public key is 3DP4UFx9wy8xGjAE1qXX5mk8GGJXYcYrKfzsVXd93BByq5bLCdoeYfa4MjBenVVDYApKfAhtiHBpZxfgxMVmyPczuEpWs2RiKcc8ZEa2qRaLyACjx9aKYvvjgfYNfyWe9X96XtKmyceDmm5ZesLs6qgpwc5qqnyYXnbfcnXT58HrpU5
Proof of possession for BLS key is R7PPtJwVS7uNGa5oQnxBhsYQshTbvbNttW1KokZtFC12sMj5bfbr7esEGz1SUbo32kDMiireCKU5XDJPQkGw85j6Y9H69ytxTZqjJJFxkcfos4XJJHmP8tMEw8oYUyqWmTzG8MSUpibgVGfphvwPV6DPQCm9zYUg5q2JCMtDbTxPz7"

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
