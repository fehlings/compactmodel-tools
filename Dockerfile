FROM debian:bookworm-backports

ARG openvaf_bin=openvaf-reloaded-osdi_0.3-31-gf47d557-linux_x64.tar.gz
ARG openvaf_cksum=9bc343d52e00529ddba452b90358cdd14da14ec7437d75dec2dbd621eda54bc8

ENV PATH=$PATH:/opt/openvaf

RUN apt-get update \
    && apt-get install -y clang ngspice/bookworm-backports
ADD --checksum=sha256:${openvaf_cksum} https://fides.fe.uni-lj.si/openvaf/download/${openvaf_bin} /
RUN mkdir /opt/openvaf \
    && tar --directory=/opt/openvaf -xvf ${openvaf_bin} \
    && rm ${openvaf_bin}
