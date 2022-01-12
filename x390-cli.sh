#!/bin/bash

#
# script for wifi easy deploy/control on Alpinelinx
# Jan 12, 2022
# v.xin.zhang@outlook.com
#

install_sw() {
  apk update
  apk add wireless-tools wpa_supplicant bash
}

scan_wifi() {
  ip link set dev $WLAN up
  SSIDs=(`iwlist $WLAN scanning | awk -F: '/SSID/ {print $NF}' | sed 's/"//g'`)
}

show_ssids() {
  echo "Available connections(SSIDs):"
  echo ${SSIDs[@]} | sed 's/ /\n/g'
}
check_wifi() {
  [ $# -ne 2 ] && help_msg && exit -1 
  scan_wifi  
  for i in ${SSIDs[@]} ;{
    [ $i == $1 ] && SSID=$1
  }

  [ `echo $2 | wc -c` -gt 8 ] && PASSWD=$2 || PASSWD=

  [ ! $SSID ] && echo "SSID:\"$1\" can not be found in this LAN, please check again!" && exit -1
  [ ! $PASSWD ] && echo "the length of password must be equal to or greater than 8" && exit -1
}

view_wifi() {
  wpa_passphrase $SSID $PASSWD 
}

conf_wifi() {
  check_wifi $@
  [ -s $WIFI_CONF ] && {
    echo "$WIFI_CONF exist!"
    echo "make a copy: ${WIFI_CONF}~"
    cp ${WIFI_CONF} ${WIFI_CONF}~
  }
  echo "$WIFI_CONF created"
  wpa_passphrase $SSID $PASSWD | tee $WIFI_CONF
}

start_wifi() {
  [ ! -s $WIFI_CONF ] && echo "$WIFI_CONF can not be found, please use cmds to generate it: $0 config [ssid] [password]" && exit -1
  echo "link up $WLAN"
  ip link set dev $WLAN up
  echo "loading wifi config ..."
  wpa_supplicant -i $WLAN -c $WIFI_CONF &
  echo "$!" > $WIFI_PID
  echo "fetching network setting ..."
  udhcpc -i $WLAN -p $UDPCHC_PID
  ip addr show dev $WLAN
}

help_msg() {
  msg=(
   \ $0 install\;
    $0 scan\;
    $0 check [ssid] [password]\;
    $0 config [ssid] [password]\;
    $0 start\;
    $0 stop\;
  )
  echo "${msg[@]}" | sed 's/;/\n/g'
}

WLAN=wlan0
SSIDs=
PASSWD=
SSID=
WIFI_CONF=/etc/wpa_supplicant/wpa_supplicant.conf
WIFI_PID=/etc/wpa_supplicant/wifi_pid.txt
UDPCHC_PID=/etc/wpa_supplicant/udhcpc_pid.txt

case $1 in 
  "install") 
    install_sw
  ;;
  "scan")
    scan_wifi
    show_ssids
  ;;
  "check")
    shift
    check_wifi $@
    view_wifi
  ;;
  "config")
    shift
    conf_wifi $@
  ;;
  "start")
    start_wifi
  ;;
  "stop")
    kill -9 `cat $WIFI_PID` && rm $WIFI_PID
    kill -9 `cat $UDPCHC_PID` && rm $UDPCHC_PID
    ip link set dev $WLAN down
  ;;
  *)
    help_msg
  ;;
esac
