#!/bin/bash
#parm 1 version, example "0.0.0"
#parm 2 peer admin card, example "PeerAdmin@fabric-network"
echo "START INTIATING NEW BUSINESS NETWORK"

composer card delete -c admin@svara000
#composer card delete -c PeerAdmin@fabric-network

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$dir")"
stop_shell= "$parentdir/stopFabric.sh"
start_shell= "$parentdir/startFabric.sh"
echo $stop_shell
echo $start_shell


composer archive create -t dir -n .

#composer card create -p connection1.json -u PeerAdmin -c /Users/cmrudi/TugasAkhir/fabric-dev-server/fabric-scripts/hlfv11/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k /Users/cmrudi/TugasAkhir/fabric-dev-server/fabric-scripts/hlfv11/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457_sk -r PeerAdmin -r ChannelAdmin

#composer card import -f PeerAdmin@fabric-network.card

composer network install --card "$2" --archiveFile svara000@"$1".bna

composer network start --networkName svara000 --networkVersion "$1" --networkAdmin admin --networkAdminEnrollSecret adminpw --card "$2" --file networkadmin.card

composer card import --file networkadmin.card

composer network ping -c admin@svara000

composer-rest-server -c admin@svara000 -n never -w true
