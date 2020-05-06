# clion-docker
Build and debug a CMake project in a Docker container, using CLion.

## Start the container
The simplest way to set this up is to use `docker-compose`. An example `docker-compose.yml` file is included in this repo, which you can add to your project.

Once you created the `docker-compose.yml` file, you can then start the container with:

````shell
docker-compose up -d
````

And stop it with:

````shell
docker-compose stop
````

If you don't want to use `docker-compose`, the incantation to start the container is:

```shell
docker run --rm -d --cap-add sys_ptrace -p127.0.0.1:2222:22 --name clion docker.pkg.github.com/regularjack/clion-docker/clion
```

And to stop:

```shell
docker stop clion
```

## Configure CLion
Now that you have the container running, you can tell CLion to build the project inside it.

This [post](https://blog.jetbrains.com/clion/2020/01/using-docker-with-clion/#using-the-remote-development-workflow-with-docker) on Jetbrains' blog details how to configure CLion. If the instructions aren't clear, check the video on top of the page for some more info.

**The credentials used in the above blogpost are different than the ones used in this repo.**

When setting up the Toolchain, make sure you use the following credentials:

- user: `clion`
- password: `clion`

## That's it

You can now build and debug your project inside the container.