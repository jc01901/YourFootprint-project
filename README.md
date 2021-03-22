# YourFootprint - Group 17
## Initial Setup
### Creating the image
This command will will build the docker image, and then run it in a container, and a rails server will be hosted on localhost:3000:
```bash
docker-compose up --build 
```
## Running bash
After the command finishes running open other terminal window and run the following command to open bash inside the container:
```bash
docker exec -it yourfootprint-group-17_web_1 /bin/bash -il
```
This command will spin up a new container using the image created in [this](#creating-the-image) command (used for debugging mainly):
```bash
docker run -it --rm yourfootprint /bin/bash -il
```
## Linux troubleshoot
### Files owned by root
If files end up owned by root the following should be run to make current user owner of all files
```bash
sudo chown -R $(whoami).users .
```
