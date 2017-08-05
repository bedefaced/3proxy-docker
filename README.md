# 3proxy-docker
Docker container with 3APA3A 3proxy server (building from [sources](https://github.com/z3APA3A/3proxy)).

3proxy config file will be generated using tiny Bash script.
You can specify preferred DNS-resolvers, login-password for users with it.
HTTP-proxy will run on 8080 container port, SOCKS4/5-proxy on 3128 container port.

Building:
```
./config.sh
docker build . -t 3proxy-docker
```
Running (example):

`docker run -d --name='3proxy' -p 34204:8080 -p 43012:3128 3proxy-docker`
