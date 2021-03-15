#Docker expects all registries to run on HTTPS.
#For this part of the tutorial we will run a version on HTTP
vi /etc/docker/docker
# add this line
DOCKER_OPTS="--insecure-registry 127.0.0.1:5000"
#and save
pkill dockerd
dockerd > /dev/null 2>&1 &
docker run -d -p 5000:5000 --name registry registry:2
docker pull hello-world
#The full name is docker.io/hello-world:latest. That breaks down into three parts:
#    docker.io - the hostname of the registry which stores the image;
#    hello-world - the repository name, in this case in {imageName} format;
#    latest - the image tag.
docker tag hello-world 127.0.0.1:5000/hello-world
docker push 127.0.0.1:5000/hello-world