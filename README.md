mozilla-syncserver-dockerfile
=============================

This is a dockerfile to build and run Mozilla SyncServer within a docker container based on a centos base image

The Dockerfile (and this content) is based on https://github.com/acaranta/mozilla-syncserver-dockerfile

It is based on https://github.com/mozilla-services/syncserver 

See https://github.com/acaranta/mozilla-syncserver-dockerfile/blob/BuildOnIndex/README.md for install instructions.

Running
-------
Basically, to run :
```
docker run -p 5000:5000 acaranta/mozilla-syncserver
```

If you want to fiddle with configuration, on your host :
```
mkdir -p /whateveryoulike/syncserver
wget https://raw.githubusercontent.com/mozilla-services/syncserver/master/syncserver.ini -O /whateveryoulike/syncserver/config.ini
#edit your config file
docker run -v /whateveryoulike/syncserver:/opt/syncserver -p 5000:5000 acaranta/mozilla-syncserver
```
