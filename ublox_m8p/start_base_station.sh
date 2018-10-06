#!/bin/bash
TS=`date +%Y%m%d-%H%M`
STR2STR=str2str
DEVICE=ttyACM0
${STR2STR} -in serial://${DEVICE}:230400#ubx -out tcpsvr://:21101 -c ./cfg_m8p_basestation.cmd &
sleep 1
netcat localhost 21101 > base-${TS}.ubx &

