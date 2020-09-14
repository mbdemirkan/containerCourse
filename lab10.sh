docker network ls
#locate the list of network plugins.
docker info
brctl show
#Swarm
#https://training.play-with-docker.com/docker-networking-hol/
docker swarm join --token SWMTKN-1-5ctdieny5u0az8e48iqeh43xt2anmu5mpyc3sk2lj7cohr4571-4wcmwe84srhcef2mhqhh8xcf7 192.168.0.22:2377
docker network create -d overlay overnet
docker service create --name myservice --network overnet --replicas 2 ubuntu sleep infinity
docker service ps myservice
docker exec -it yourcontainerid /bin/bash