FROM	debian:buster

RUN		mkdir -p /tools

COPY	./tools/* /tools/
COPY	./config/* /tools/

RUN		chmod 755 -R /tools

ENTRYPOINT [ "/tools/script.sh" ]