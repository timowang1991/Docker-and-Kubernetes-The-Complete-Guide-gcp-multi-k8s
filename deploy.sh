docker build -t timowang1991/multi-client:latest -t timowang1991/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t timowang1991/multi-server:latest -t timowang1991/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t timowang1991/multi-worker:latest -t timowang1991/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push timowang1991/multi-client:latest
docker push timowang1991/multi-server:latest
docker push timowang1991/multi-worker:latest
docker push timowang1991/multi-client:$SHA
docker push timowang1991/multi-server:$SHA
docker push timowang1991/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=timowang1991/multi-client:$SHA
kubectl set image deployments/server-deployment server=timowang1991/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=timowang1991/multi-worker:$SHA