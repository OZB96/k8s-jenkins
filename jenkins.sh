#!/bin/bash
#k3d cluster create jenkins -v /etc/machine-id:/etc/machine-id:ro -v /var/log/journal:/var/log/journal:ro -v /var/run/docker.sock:/var/run/docker.sock --agents 3 -p 30000-32767:30000-32767@server[0] -p 80:80@loadbalancer
#source <(k3d completion bash)
#source <(kubectl completion bash)
#kubectl apply -f jenkins.namespace.yaml
#kubectl apply -f jenkins.helm.yaml
kubectl apply -f jenkins.namespace.yaml -f jenkins.helm.yaml -f ingress.yaml -f clusterRole.yaml
#kubectl -n jenkins apply -f clusterRole.yaml
#kubectl -n jenkins apply -f ingress.yaml
sleep 60
echo "Making progress"
. query.sh
#kubectl -n jenkins apply -f service.yaml
#kubectl -n jenkins apply -f ingress.yaml
