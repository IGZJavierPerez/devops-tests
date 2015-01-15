echo "Deleting active containers...."
docker ps -q | xargs docker rm -f 2>/dev/null

echo "Starting mongodb container...."
docker run  -d --name mongodb dockerfile/mongodb

echo "Installing npm dependencies...."
docker run -v $(pwd):/data -it --rm dockerfile/nodejs npm install

echo "Starting server..."
sudo docker run -v $(pwd):/data -i -t -p 3001:3001 --rm --link mongodb:mongodb dockerfile/nodejs npm run-script docker-server
