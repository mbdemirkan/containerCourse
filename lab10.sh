docker network ls
#locate the list of network plugins.
docker info
brctl show
#Swarm
#https://training.play-with-docker.com/docker-networking-hol/
docker swarm init --advertise-addr $(hostname -i)
docker network create -d overlay overnet
docker service create --name myservice --network overnet --replicas 2 ubuntu sleep infinity
docker service ps myservice
docker exec -it yourcontainerid /bin/bash