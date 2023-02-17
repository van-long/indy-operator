#!/bin/bash

# Helm install indy indy-chart/
# copy stewards info
# fill in csv file
# generate Genesis files

container_id=$(docker run -dti von-network-base)
docker cp ./scripts/genesis_from_file.py $container_id:/home/indy/
docker cp ./csv/stewards.csv $container_id:/home/indy/
docker cp ./csv/trustees.csv $container_id:/home/indy/

docker exec -ti $container_id bash -c "python genesis_from_file.py --trustees trustees.csv --stewards stewards.csv"
docker cp $container_id:/home/indy/domain_transactions_genesis ./genesis
docker cp $container_id:/home/indy/pool_transactions_genesis ./genesis

docker stop $container_id
