https://github.com/linkedin/Burrow

# config example

[wiki](https://github.com/linkedin/Burrow/wiki/Configuration)


## _burrow.cfg_

```
[general]
logdir=/data/logs
pidfile=burrow.pid
client-id=burrow-lagchecker
#logconfig=logging.cfg

[zookeeper]
hostname=127.0.0.1
port=2181
timeout=6
lock-path=/burrow/notifier

[kafka "local"]
broker=127.0.0.1
broker-port=9092
zookeeper=127.0.0.1
zookeeper-port=2181
zookeeper-path=/
zookeeper-offsets=false
offsets-topic=__consumer_offsets

[tickers]
broker-offsets=5

[httpserver]
server=on
port=8000
```

# run docker

```
rm /data/burrow/logs/*.pid
docker run -it --rm \
           --net=host \
           -v /data/burrow:/data/burrow \
           -v /data/burrow/logs:/data/logs \
           <image>:latest \
           /opt/Burrow -config /data/burrow/burrow.cfg
```

# http endpoints

see [Burrow Wiki](https://github.com/linkedin/Burrow/wiki/HTTP-Endpoint)

