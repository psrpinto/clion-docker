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

### Starting the container
```shell
docker run --rm -d --cap-add sys_ptrace -p127.0.0.1:2222:22 --name clion regularjack/clion
```

### Stopping the container
```shell
docker stop clion
```