# x390-cli.sh script Desc
+ Machine Holds Alpine Linux: Thinkpad x390
+ Wireless HW: Intel Wireless-AC 9560 160MHz, REV=0x354
+ WAN Chipest: Fibocom, L850-GL-07
+ Create Date: Jan 12, 2022
+ Author: x.vin.zhang@outlook.com
+ Language: Bash

## Help message
```
 # ./x390-cli.sh
   ./x390-cli.sh install
   ./x390-cli.sh scan
   ./x390-cli.sh check [ssid] [password]
   ./x390-cli.sh config [ssid] [password]
   ./x390-cli.sh start
   ./x390-cli.sh stop
```

### Install softwares

```
# ./x390-cli.sh install
```

### Scan the LAN network

```
# ./x390-cli.sh scan
Available connections(SSIDs):
spacexxx
\xE5\xB0\x8F\ABWiFi_90F8
spacexxx_5g
```

### Check the SSID and Password works or not

```
# ./x390-cli.sh check spacexxx ********
network={
	ssid="spacexxx"
	#psk="********"
	psk=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
}
```


### Start the program, here it's failed because without the config file for wpa_supplicant

```
# ./x390-cli.sh start
/etc/wpa_supplicant/wpa_supplicant.conf can not be found, please use cmds to generate it: ./x390-cli.sh config [ssid] [password]
```



### Config the wifi setting, choose the wifi SSID and set its password

```
# ./x390-cli.sh config spacexxx ********
/etc/wpa_supplicant/wpa_supplicant.conf created
network={
	ssid="spacexxx"
	#psk="********"
	psk=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
}
```


### Start the program

```
# ./x390-cli.sh start
link up wlan0
loading wifi config ...
fetching network setting ...
Successfully initialized wpa_supplicant
wlan0: SME: Trying to authenticate with 50:xx:xx:xx:xx:xx (SSID='spacexxx' freq=2437 MHz)
wlan0: Trying to associate with 50:xx:xx:xx:xx:xx (SSID='spacexxx' freq=2437 MHz)
wlan0: Associated with 50:xx:xx:xx:xx:xx
wlan0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=0
wlan0: WPA: Key negotiation completed with 50:xx:xx:xx:xx:xx [PTK=CCMP GTK=TKIP]
wlan0: CTRL-EVENT-CONNECTED - Connection to 50:xx:xx:xx:xx:xx completed [id=0 id_str=]
2: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP qlen 1000
    link/ether ac:67:xx:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.6/24 brd 192.168.1.255 scope global wlan0
       valid_lft forever preferred_lft forever
    inet6 fe80::xxxx:xxxx:xxxx:xxxx/64 scope link 
       valid_lft forever preferred_lft forever
```

### Stop the program

```
# ./x390-cli.sh stop
```
