# stvid-docker

Docker container of cbassa's stvid<br>
Somewhat designed for the dev branch 2022-09, will evolve over time.

# Install

Refer to docker installation on how to get the latest installed on your system.<br>
Short version, ymmv: Base image: Rasperry Pi OS 32bit Lite (bullseye):
```
# already installed: ca-certificates curl lsb-release
# optional: tmux uidmap
sudo apt update
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release git

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
echo "deb https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# add user to docker group, avoid needing sudo, re-login to apply
sudo adduser pi docker
```

Pulling the latest image will be performed when the container is started, this will take some time.<br>

If you want more control or don't trust the image, you can use the `./build.sh` and it will build it for you from the sources.

# Useage

The `srv` directory is mounted inside the container at `/srv`<br>
By default it contains the old and new config, that you should edit to your needs.<br>
Environment variables can be set in `srv/stvid.env` and is read by `entrypoint.sh`<br>
Workdir is `/srv`<br>

When running the container, by default gets you a bash shell. You can change this by passing argument to docker run, for example: `./run.sh acquire.py`.<br>

Other useful scripts will be put into `srv`<br>

