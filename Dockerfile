FROM alpine:latest as builder

# to reduce image size all build and cleanup steps are performed in one docker layer

RUN \
  echo "# INSTALL DEPENDENCIES ##########################################" && \
  apk --no-cache add curl g++ gcc git make && \
  mkdir -p /tmp/build && \
  echo "# FETCH INSTALLATION FILES ######################################" && \
  curl https://raw.githubusercontent.com/ioquake/ioq3/master/misc/linux/server_compile.sh -o /tmp/build/compile.sh && \
  curl https://ioquake3.org/data/quake3-latest-pk3s.zip --referer https://ioquake3.org/extras/patch-data/ -o /tmp/build/quake3-latest-pk3s.zip && \
  echo "# NOW THE INSTALLATION ##########################################" && \
  echo "y" | sh /tmp/build/compile.sh && \
  unzip /tmp/build/quake3-latest-pk3s.zip -d /tmp/build/ && \
  cp -r /tmp/build/quake3-latest-pk3s/* ~/ioquake3
RUN \
  echo "# INSTALL DEPENDENCIES ##########################################" && \
  wget http://osp.dget.cc/orangesmoothie/downloads/osp-Quake3-1.03a_full.zip && \
  unzip osp-Quake3-1.03a_full.zip -d /root/ioquake3 && \
  echo "# CLEAN UP ######################################################" && \
  rm osp-Quake3-1.03a_full.zip
FROM alpine:latest
RUN adduser ioq3srv -D
COPY --from=builder /root/ioquake3 /home/ioq3srv/ioquake3
COPY ./build/pak0.pk3 /home/ioq3srv/ioquake3/baseq3/pak0.pk3
USER ioq3srv
EXPOSE 27960/udp
ENTRYPOINT ["/home/ioq3srv/ioquake3/ioq3ded.x86_64"]
CMD ["+map", "q3dm17", "+exec", "server.cfg", "+set", "fs_game", "osp"]
