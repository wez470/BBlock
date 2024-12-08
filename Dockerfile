FROM ubuntu:24.04
COPY --from=golang:1.23 /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"
RUN apt update && apt install -y \
    gcc \
    clang \
    clang-format \
    libbpf-dev \
    pkg-config \
    m4 \
    llvm \
    make \
    libpcap-dev \
    git
RUN git clone --recurse-submodules https://github.com/libbpf/bpftool.git
WORKDIR /bpftool/src
RUN make install && mv bpftool /usr/sbin/