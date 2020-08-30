#!/bin/bash
POD=$(sudo kubectl get pods -n jenkins -o json | jq '.items[1].metadata.name' | xargs)
echo "Jenkins credentials"
while [[ "$(sudo kubectl -n jenkins --container jenkins exec $POD -- env | grep ADMIN_USER | sed 's/.*=//')" == "" ]] ; do
sleep 2;
POD=$(sudo kubectl get pods -n jenkins -o json | jq '.items[1].metadata.name' | xargs)
done

echo username: $(sudo kubectl -n jenkins --container jenkins exec $POD -- env | grep ADMIN_USER | sed 's/.*=//')
echo password: $(sudo kubectl -n jenkins --container jenkins exec $POD -- env | grep ADMIN_PASSWORD | sed 's/.*=//')
echo port: $(sudo kubectl get service jenkins -n jenkins -o json | jq '.spec.ports[0].nodePort')

