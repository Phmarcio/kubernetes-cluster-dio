#/bin/bash

echo "criando as imagens..."

docker build -t DOCKER_HUB_USER/projeto-backend-php:1.0 backend/.
docker build -t DOCKER_HUB_USER/projeto-database:1.0 database/.

echo "Realizando push das imagens..."

docker push DOCKER_HUB_USER/projeto-backend-php:1.0
docker push DOCKER_HUB_USER/projeto-database:1.0


echo "Criando os serviços do cluster k8s..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml