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
* `git clone https://github.com/ibuetler/alpine-linux-setup`
* `cd alpine-linux-setup`
* `./setup.sh`

## Manual Personalization
* login as `ibuetler`
* ssh-keygen
* copy `id_rsa.pub` to SSH keys on github
* `eval ``ssh-agent -s`` `
* `ssh-add`
* `cd /opt/docker`
* `./clone.sh`
* `docker login`
* `./update-docker-push.sh`
