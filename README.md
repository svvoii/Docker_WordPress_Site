# Docker Wordpress Site

This setup will pull 3 images form docker hub
- MySQL (as website database, version 5.7)
- PhpMyAdmin (for database management, latest version)
- Wordpress (website builder, latest version)

#### REQUIREMENTS
- Linux OS
- `make` must be installed
- `docker` and `docker-compose` must be installed
- `git` must be installed.. ;)

### USAGE
There is a simple Makefile which will simplify the usage..

From this directory run the following:
``` bash
make pull
``` 
^ this will simply pull the images from the docker hub

```bash
make up
``` 
^ this will create two directories in the current directory, one for the database and one for the wordpress files. It will then start the containers.

```bash
make down
```
^ this will stop the containers and remove them

```bash
make clean
``` 
^ this will remove created volumes and networks

```bash
make fclean
``` 
^ this will remove created volumes, networks and images.  
!! CAREFUL !!  
the `fclean` will also remove the directories created for the database and wordpress files. Any changes made to the wordpress files will be lost.

```bash
make ls
``` 
^ this will list all the available images, running containers, volumes and custom made networks

```bash
make logs
``` 
^ this will show the logs of the running containers (if any). This might be helpful while debugging.

#### NOTE   
Credentials and passwords for all containers are stored in the `.env` file.  
It is highly recommended to change the values of the environment variables for more secure ones, as well as make `.env` file to be ignored by git for security.

After `make up` and waiting for all things to be installed and running (to check `make ls`),   
WordPress can be accessed at `localhost:8000`  
PhpMyAdmin is accessible at `licalhost:8080`

==
