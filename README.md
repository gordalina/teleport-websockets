# Teleport Websockets

This repository shows an issue with teleport forwarding websockets via application access.

The application was setup using `mix phx.new teleport_websockets --live --no-ecto --no-gettext --no-mailer --no-assets` which creates a default configuration, which was commited in the first commit.

Any changes to the application can be seen in further commits.

## Running locally

```sh
# build
docker build . -t teleport-websockets:latest

# run
docker run -e 'SECRET_KEY_BASE=KzfwwW5CUvnp8B4OJOqOUOM0Hn0HbIu8eWkn++gAFOU09qHhWJ9rrMTOJiNqvbNf' -e PHX_SERVER=true -e PORT=4000 -p 4000:4000 teleport-websockets:latest

# open livedashboard and see that websockets are working
open http://localhost:4000/dashboard/home
```

## Running in kubernetes

```sh
# apply
kubectl apply -f kubernetes.yaml

# port forward the service to localhost:4000
kubectl port-forward svc/teleport-websockets 4000:80

# open livedashboard and see that websockets are working
open http://localhost:4000/dashboard/home
```

## Configuring Application Access via Teleport

Assuming the kubernetes cluster has a kube agent running with an `app` role then use the following configuration:

```yaml
name: "teleport-websockets"
uri: "http://teleport-websockets.default.svc.cluster.local"
```

Open the application via `https://teleport-websockets.CLUSTER_NAME.teleport.sh` and see that the application can load the page, it can't connect to the websocket.

