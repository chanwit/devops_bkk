FROM chanwit/open-cobol

RUN mkdir /src
COPY . /src
WORKDIR /src

RUN cobc -static -free -x -ffunctions-all -o helloworld-exe helloworld.cob
RUN ldd helloworld-exe

FROM scratch
COPY --from=0 /usr/lib/libcob.so.1 /usr/lib/libcob.so.1
COPY --from=0 /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=0 /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
COPY --from=0 /usr/lib/x86_64-linux-gnu/libgmp.so.10 /usr/lib/x86_64-linux-gnu/libgmp.so.10
COPY --from=0 /lib/x86_64-linux-gnu/libncurses.so.5 /lib/x86_64-linux-gnu/libncurses.so.5
COPY --from=0 /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/libtinfo.so.5
COPY --from=0 /usr/lib/x86_64-linux-gnu/libdb-5.3.so /usr/lib/x86_64-linux-gnu/libdb-5.3.so
COPY --from=0 /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2
COPY --from=0 /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=0 /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=0 /src/helloworld-exe /app/helloworld-exe

WORKDIR /app

ENTRYPOINT ["/app/helloworld-exe"]

