# clion-docker

A minimal Docker image for C++ development using CLion.

## Using CLion with Docker

For detailed information on using Docker with CLion see https://blog.jetbrains.com/clion/2020/01/using-docker-with-clion

## SSH credentials

**The credentials used in the above blogpost are different than the ones used in this image.**

When setting up the [Toolchain](https://blog.jetbrains.com/clion/2020/01/using-docker-with-clion/#using-the-remote-development-workflow-with-docker) in CLion, make sure you use the following credentials:

- user: `clion`
- password: `clion`

## Usage

### With `docker-compose`
An example `docker-compose.yml` is included in this repo. If you add it to your project, you can start the container by simply doing:

````shell
docker-compose up -d
````

And stop it with:

````shell
docker-compose stop
````

### Without `docker-compose`
If you don't want to use `docker-compose`, the incantation to start the container is:

```shell
docker run --rm -d --cap-add sys_ptrace -p127.0.0.1:2222:22 --name clion docker.pkg.github.com/regularjack/clion-docker/clion
```

And stop it with:

```shell
docker stop clion
```