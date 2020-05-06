#!/usr/bin/env bash

docker build -t docker.pkg.github.com/regularjack/clion-docker/clion:latest .

docker push docker.pkg.github.com/regularjack/clion-docker/clion:latest
