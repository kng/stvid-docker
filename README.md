# stvid-docker

Docker container of cbassa's stvid<br>
Somewhat designed for the dev branch 2022-09, will evolve over time.

# Install

Refer to docker installation on how to get the latest installed on your system, do not use the distributions package.<br>

Pulling the latest image will be performed when the container is started, this will take some time.<br>

If you want more control or don't trust the image, you can use the `./build.sh` and it will build it for you from the sources.

# Useage

The ./data directory is mounted inside the container at /data.<br>
By default it contains the old and new config, that you should edit to your needs.<br>
Environment variables can be set in data/stvid.env and is read by entrypoint.sh<br>

When running the container, by default gets you a bash shell. You can change this by passing argument to docker run, for example: `./run.sh acquire.py`.<br>

Other useful scripts will be put into data/<br>

