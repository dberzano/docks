FROM alisw/ubuntu1404-builder

ENV LLVM_VER 3.5
ENV SAS=/sas
ENV LD_LIBRARY_PATH=$SAS/lib:$LD_LIBRARY_PATH

RUN apt-get update && \
    apt-get install -y cmake libclang-$LLVM_VER-dev \
                       llvm-$LLVM_VER-tools lvm-$LLVM_VER-dev

RUN mkdir -p $SAS/build && \
    cd $SAS/build && \
    git clone https://github.com/dberzano/SAS $SAS/src && \
    cmake $SAS/src -DCMAKE_INSTALL_PREFIX=$SAS && \
    make -j$(grep -c /proc/cpuinfo bogomips) install
