### Build postgres image

```sh
docker image build . -t taskmanager_postgres
```

### Create docker container

```sh
docker run -d -p 5432:5432 --name taskmanager_db taskmanager_postgres
```
