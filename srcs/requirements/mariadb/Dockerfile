FROM		debian:buster

RUN			echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# copy predefined scripts to tmp of container, data are cleared upon machine restart.
COPY		./tools/script.sh 	/tmp/

# installation of necessary packages
RUN			apt-get update && apt-get install -y \
			mariadb-server \
			mariadb-client \
			dumb-init

# solves many of these problems: in front of the command it will take on the role of PID 1.
# It immediately spawns the process as PID ~2, and then proxies on any signals it receives. 
# This helps to avoid special kernel behavior applied to PID 1, 
# while also handling regular responsibilities of the init system (like reaping orphaned zombie processes).
ENTRYPOINT	["/usr/bin/dumb-init"]

# execute script
CMD			["bash", "/tmp/script.sh"]
