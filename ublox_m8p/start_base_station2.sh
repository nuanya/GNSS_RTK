#!/bin/bash
TS=`date +%Y%m%d-%H%M`
STR2STR=str2str
DEVICE=ttyACM0
${STR2STR} -in serial://${DEVICE}:230400#ubx -out tcpsvr://:21102 -c ./cfg_m8p_basestation.cmd &
netcat localhost 21102 > base-${TS}.ubx &

# Make RTCM3 available on port 21101
netcat localhost 21102 | ./rtcm3_filter | ${STR2STR} -out tcpsvr://:21101


