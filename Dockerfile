FROM debian:bullseye
MAINTAINER sa2kng <knegge@gmail.com>

# base system
RUN apt-get update && apt-get -qq install git pkg-config python3-pip libopenjp2-7 libhdf5-103 libavcodec58 libavformat58 libswscale5 libatlas-base-dev ffmpeg source-extractor astrometry.net libeigen3-dev

# customize the astrometry-data-*
RUN apt-get -qq install astrometry-data-tycho2 astrometry-data-tycho2-07 astrometry-data-tycho2-08 astrometry-data-tycho2-09 astrometry-data-tycho2-10-19

# python packages
RUN apt-get -qq install python3-numpy python3-astropy python3-scipy python3-cycler python3-termcolor python3-astropy python3-matplotlib python3-opencv python3-kiwisolver python3-pyparsing python3-dateutil python3-six python3-prctl python3-termcolor python3-tz

#RUN pip3 install -e git+https://github.com/kerel-fs/stvid.git@pr/fix73[cv] --prefer-binary
#RUN pip3 install "stvid[cv,asi,picamera] @ git+https://github.com/kerel-fs/stvid.git@pr/fix73" --prefer-binary
#RUN pip3 install -e git+https://github.com/kerel-fs/stvid.git@pr/fix73#egg=stvid

# pip install what's not in package
RUN pip3 install zwoasi picamera2 spacetrack --prefer-binary

RUN git clone https://gitlab.com/pierros/hough3d-code.git /hough3d-code &&\
	cd /hough3d-code &&\
	make all &&\
	cp -p hough3dlines /usr/local/bin/hough3dlines &&\
	cd / && rm -rf /hough3d-code

RUN git clone https://github.com/cbassa/satpredict /satpredict &&\
	cd /satpredict &&\
	make &&\
	make install &&\
	cd / && rm -rf /satpredict

#RUN sudo apt install giza-dev git make dos2unix source-extractor wcslib-dev libgsl-dev gfortran libpng-dev libx11-dev libjpeg-dev libexif-dev
#RUN git clone https://github.com/cbassa/sattools /sattools

RUN git clone -b dev https://github.com/cbassa/stvid.git /opt/stvid
RUN chmod 0755 /opt/stvid/*.py
RUN ln -s /usr/bin/source-extractor /usr/local/bin/sextractor
# workaround, ST_DATADIR=/stvid and this symlink
RUN ln -s /opt/stvid/source-extractor/ /opt/stvid/sextractor
#RUN sed 's/^#inparallel/inparallel/' /etc/astrometry.cfg > /etc/astrometry.cfg

COPY entrypoint.sh /
ENTRYPOINT ["bash", "/entrypoint.sh"]
WORKDIR /srv
#CMD /opt/stvid/acquire.py
CMD bash
