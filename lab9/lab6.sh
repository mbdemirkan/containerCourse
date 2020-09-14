#Container Layer
docker container run --name a1 -ti alpine sh
mkdir /data && cd /data && touch hello.txt
exit
docker inspect -f "{{ json .GraphDriver.Data }}" a1 | jq
cd $(docker container inspect -f "{{ json .GraphDriver.Data.UpperDir }}" a1 | sed 's/"//g')
docker container rm a1

#Volume on build
docker image build -t img_a2 .
docker container run --name a2 img_a2
cd $(docker inspect -f "{{ json .Mounts }}" a2 | jq '.[] | .Source' | sed 's/"//g')
docker container rm a2

#Volume at runtime
docker container run --name a3 -d -v /data alpine sh -c 'ping 8.8.8.8 > /data/ping.txt'
cd $(docker inspect -f "{{ json .Mounts }}" a3 | jq '.[] | .Source' | sed 's/"//g')
docker container rm a2

#Volume using api
docker volume create --name html
docker volume ls
docker volume inspect html
docker run --name www -d -p 80:80 -v html:/usr/share/nginx/html nginx

#Bind-mounting - mount host’s folder into a container
#1st case
docker container run -ti -v /tmp:/data alpine sh
ls /data
#2nd case
docker container run -ti -v /tmp:/usr/share/nginx/html nginx bash
ls /usr/share/nginx/html

#tmpfs mount
#As opposed to volumes and bind mounts, a tmpfs mount is temporary, and only persisted in the host memory. When the container stops, the tmpfs mount is removed, and files written there won’t be persisted.
#This is useful to temporarily store sensitive files that you don’t want to persist in either the host or the container writable layer.
#Limitations of tmpfs mounts
#Unlike volumes and bind mounts, you can’t share tmpfs mounts between containers.
#This functionality is only available if you’re running Docker on Linux.
docker run --rm --read-only -it nginx
--tmpfs=/var

--mount type=tmpfs,destination=/app,tmpfs-mode=1770
