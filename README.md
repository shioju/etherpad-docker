# etherpad-docker
Makes it a breeze to spin up Etherpad with MySQL.

## Usage
```
docker-compose up -d
```
Etherpad server might fail to connect to the database sometimes, because `depends_on: db` only waits until the `db` is "started" instead of "ready". Refer to https://docs.docker.com/compose/compose-file/ for more details.
