## Inigo

## Docker Build

```
docker build -t apollo-yarn-action-docker-example .
```

 ## Docker Run

```
INIGO_SERVICE_TOKEN=ey...
docker run -p 4000:4000 -e INIGO_SERVICE_TOKEN=$INIGO_SERVICE_TOKEN apollo-yarn-action-docker-example
```