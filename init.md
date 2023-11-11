To perform clean init of project:
```
git clone --recurse https://github.com/alejontnu/am-robot
cd am-robot
git checkout 48d71d7
cd ..
```


To build docker container
```
docker build -t franka-test .
```


To run docker container for am-robot
```
docker run -it \
    --mount type=bind,source=$(pwd)/am-robot,target=/am-robot \
    --net=host --privileged \
    --device=/dev/ttyUSB0 \
    franka-test:latest 
```
To run docker container for AM-robot
```
docker run -it \
    --mount type=bind,source=$(pwd)/AM-robot,target=/AM-robot \
    --net=host --privileged \
    --device=/dev/ttyUSB0 \
    franka-test:latest 
```

To build+run in single command for am-robot:
```
docker run -it \
    --mount type=bind,source=$(pwd)/am-robot,target=/am-robot \
    --net=host --privileged \
    --device=/dev/ttyUSB0 \
    $(docker build -q .)
```

To build+run in single command for AM-robot:
docker run -it \
    --mount type=bind,source=$(pwd)/AM-robot,target=/AM-robot \
    --net=host --privileged \
    --device=/dev/ttyUSB0 \
    $(docker build -q .)
