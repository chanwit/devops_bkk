docker build -t chanwit/helloworld-cob -f Dockerfile.dev .
ID=$(docker create chanwit/helloworld-cob)

docker cp $ID:/app/helloworld-exe .
docker rm -f $ID
