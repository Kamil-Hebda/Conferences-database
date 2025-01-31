# PostgreSQL Docker Setup Guide

## Prerequisites
Make sure you have **Docker** installed on your system.

---

## 1. Build a New Docker Image
Run the following command to build the image:
```sh
docker build -t my-postgres .
```

---

## 2. Run the PostgreSQL Container
Start a new container from the image:
```sh
docker run --name my-postgres-container -p 5432:5432 -d my-postgres
```

- `--name my-postgres-container`: Assigns a custom name to the container.
- `-p 5432:5432`: Maps port 5432 from the container to your machine.
- `-d`: Runs the container in detached mode (in the background).

---

## 3. Access PostgreSQL in the Container
Enter the running container's shell:
```sh
docker exec -it my-postgres-container psql -U myuser -d conferences
```

---

## 4. Stop and Restart the Container
To stop and remove the container:
```sh
docker stop my-postgres-container
docker rm my-postgres-container

```