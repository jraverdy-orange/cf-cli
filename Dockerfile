FROM alpine:latest
RUN  apk add --update curl python py-pip iptables openssh
RUN  curl -O https://s3-us-west-1.amazonaws.com/cf-cli-releases/releases/v6.43.0/cf-cli_6.43.0_linux_x86-64.tgz
RUN  tar xf cf-cli_6.43.0_linux_x86-64.tgz cf -C /usr/local/bin
RUN  rm -rf cf-cli_6.43.0_linux_x86-64.tgz
RUN  pip install sshuttle
RUN  apk --purge -v del py-pip curl
