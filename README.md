# alpine-linux-setup
Alpine Linux Setup

# Alpine Linux
## Base Installation
* download iso from internet
* create vm, boot
* run `setup-alpine` script
* `reboot`

## Auto Personalization
* login as `root`
* `apk add git`
* `git clone https://github.com/ibuetler/alpine-linux-setup`
* `cd alpine-linux-setup`
* `./setup.sh`

## Manual Personalization
* login as `ibuetler`
* `ssh-keygen`

````
eval `ssh-agent -s`
ssh-add
````

## YouTube Video
* https://youtu.be/X_T-cKum8dc


