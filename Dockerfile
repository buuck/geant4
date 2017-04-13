FROM buuck/clhep:2.3.4.4
MAINTAINER Micah Buuck (mbuuck@uw.edu)
WORKDIR /

#Install dependencies
RUN apt-get update && apt-get install -y cmake g++ gcc libexpat1-dev \
libxerces-c-dev libx11-dev libxmu-dev libgl1-mesa-dev

#Build geant4
ENV GEANT4_VERSION 10.03.p01
RUN mkdir mjsw/mjdeps/geant4 && mkdir mjsw/mjdeps/geant4/geant4.$GEANT4_VERSION
WORKDIR mjsw/mjdeps/geant4/geant4.$GEANT4_VERSION
RUN mkdir src && mkdir build && mkdir install
COPY . src
WORKDIR build
RUN cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=../install -DCMAKE_BUILD_TYPE=RelWithDebInfo -DGEANT4_INSTALL_DATA=ON -DCLHEP_ROOT_DIR=$CLHEP_BASE_DIR -DCMAKE_COMPILER_IS_GNUCXX=ON -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_GDML=ON ../src 2>&1 | tee cmake.log
RUN make
RUN make install

#Remove build files (only useful if image is generated with --squash)
RUN rm -rf *
WORKDIR /mjsw/mjdeps/geant4/geant4.$GEANT4_VERSION
RUN rmdir build
RUN rm /mjsw/mjdeps/geant4/geant4.$GEANT4_VERSION.tar.gz 

#Setup geant4 environment
ENV CLHEP_BASE_DIR /mjsw/mjdeps/CLHEP/$CLHEP_VERSION/install
ENV LD_LIBRARY_PATH $CLHEP_BASE_DIR/lib:$LD_LIBRARY_PATH

WORKDIR /
CMD /bin/bash
