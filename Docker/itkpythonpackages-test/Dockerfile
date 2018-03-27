FROM ubuntu:16.04 as itkpythonpackages-test
MAINTAINER Francois Budin <francois.budin@kitware.com>

RUN apt-get update && apt-get install -y \
  software-properties-common \
  apt-utils \
  build-essential \
  curl \
  git \
  ninja-build \
  python \
  python3 \
  vim \
  virtualenvwrapper \
  wget

RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update && apt-get install -y \
  python3.6 \
  && apt-get clean

# Install the latest CMake release
WORKDIR /tmp/

RUN curl  -L https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Build and install CMake from source for Ninja build job patch to be released with CMake 3.11
# Commit 07185055d57f28347a1850a1f06787ac93f20afd
WORKDIR /usr/src
RUN apt-get install -y libncurses-dev libssl-dev && \
  git clone https://github.com/Kitware/CMake.git CMake && \
  cd CMake && \
  git checkout e841ae823edc3021aaa5b297be715344a9bca47e && \
  mkdir /usr/src/CMake-build && \
  cd /usr/src/CMake-build && \
  /usr/src/CMake/bootstrap \
    --parallel=5 \
    --prefix=/usr && \
  make -j5 && \
  ./bin/cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_USE_OPENSSL:BOOL=ON . && \
  make install && \
  cd .. && \
  rm -rf CMake* && \
  apt-get clean

RUN mkdir /work
WORKDIR /work
ENV ITKExamples_VERSION c3bd824a82feb6f76622cefd1b9134016f23a823
RUN git clone https://github.com/fbudin69500/ITKExamples.git \
  && cd ITKExamples \
  && git checkout ${ITKExamples_VERSION}
RUN mkdir /work/ITKExamples-build

WORKDIR /work/ITKExamples-build
RUN cmake -GNinja \
  -DBUILD_DOCUMENTATION:BOOL=OFF \
  ../ITKExamples/Superbuild && \
  ninja

ADD cmd.sh /cmd.sh
CMD /cmd.sh
