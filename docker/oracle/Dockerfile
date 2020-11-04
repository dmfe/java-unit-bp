FROM oracleinanutshell/oracle-xe-11g

COPY ./login.sql /root
COPY ./sqlplus.wordlist /root

RUN apt-get update && \
    apt-get -y install rlwrap less vim && \
    echo "alias sqlplus=\"rlwrap -pBlue -i -b '()=\!<>&+-*|:;,' -f ~/sqlplus.wordlist sqlplus\"" \
    >> ~/.bashrc