#!/bin/sh

sed -i 's/CERTIFICATE_AUTHORITY/$CERTIFICATE_AUTHORITY/g' /kubeconfig
sed -i 's/SERVER_ADDRESS/$SERVER_ADDRESS/g' /kubeconfig
sed -i 's/USER_TOKEN/$USER_TOKEN/g' /kubeconfig

fission spec apply