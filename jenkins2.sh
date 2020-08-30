source <(sudo k3s completion bash)
source <(sudo kubectl completion bash)
sudo kubectl apply -f jenkins.namespace.yaml
sudo kubectl apply -f jenkins.helm.yaml
sudo kubectl -n jenkins apply -f clusterRole.yaml
sudo kubectl -n jenkins apply -f ingress.yaml
sleep 60
echo "Making progress"
. query.sh

