# Inicializa os dispositivos
kubectl apply -f /wp3-experiment/Deploy/servers.yaml
kubectl apply -f /wp3-experiment/Deploy/network_1.yaml
kubectl apply -f /wp3-experiment/Deploy/network_2.yaml
kubectl apply -f /wp3-experiment/Deploy/network_3.yaml

# Dorme por 20:20 minutos
sleep 1220

# Deleta todos os pods
kubectl delete pods --all
