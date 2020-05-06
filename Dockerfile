# CLion remote docker environment (How to build docker container, run and stop it)
#
# Build and run:
#   docker build -t regularjack/clion .
#   docker run --rm -d --cap-add sys_ptrace -p127.0.0.1:2222:22 --name clion regularjack/clion
#   ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:2222"
#
# stop:
#   docker stop clion
#
# ssh credentials (test user):
#  user: clion
#  password: clion

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends -y\
    ssh \
    gdb \
    make \
    clang \
    cmake \
    rsync \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd \
  && useradd -m clion \
  && yes clion | passwd clion

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]