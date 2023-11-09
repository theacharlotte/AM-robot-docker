FROM ubuntu
RUN apt-get update
RUN apt-get install -y \
    git \
    cmake \
    gcc g++ \
    libpoco-dev libeigen3-dev



# LIBFRANKA
WORKDIR /

RUN git clone --recursive --branch 0.9.2 https://github.com/frankaemika/libfranka
RUN cd libfranka
RUN mkdir build
RUN cd build
WORKDIR /libfranka/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF ..
RUN cmake --build .
RUN cpack -G DEB
RUN dpkg -i libfranka*.deb



# FRANKX
WORKDIR /

RUN apt-get install -y \
    python3.10 python3-pip pybind11-dev \
    catch2
RUN rm -f /usr/bin/python3
RUN ln -s /usr/bin/python3.10 /usr/bin/python3
RUN pip install pybind11

#frankx 0.2.0
RUN git clone --recurse --branch v0.2.0 https://github.com/pantor/frankx

WORKDIR /frankx
RUN mkdir -p build
RUN cd build
WORKDIR /frankx/build
RUN cmake -DBUILD_TYPE=Release -DBUILD_TESTS=0 ..
RUN make
RUN make install

# customize setup.py to also export _movex
WORKDIR /frankx
RUN sed -i -e "s/ext_modules=\[\(.*\)\],/ext_modules=[\1, CMakeExtension('_movex')],/" setup.py 
RUN pip install -e .



# AM-ROBOT
WORKDIR /
RUN pip install plotly argparse gcodeparser 
RUN pip install numpy pandas pyserial serialstruct
RUN pip install matplotlib mgen
WORKDIR /am-robot
#CMD pip install -e . && python3 src/am_robot/main.py
