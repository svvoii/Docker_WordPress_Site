# Docker Wordpress Deveopment Setup

This setup will pull 3 images form docker hub
- MySQL (as website database, version 5.7). About 500MB.
- PhpMyAdmin (for database management, latest version). About 740MB.
- Wordpress (website builder, latest version). About 570MB.

#### REQUIREMENTS
- Linux based OS
- `make` must be installed
- `docker` and `docker-compose` must be installed

### USAGE
There is a simple Makefile which will simplify the usage..  
It takes 1 command `make up` to create the Wordpress development environment.  

Here are all the available `make` commands.
From current directory run the following:
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
^ this will stop the containers and remove them (images will still be available)

```bash
make restart
```  
^ this will restart the containers

```bash
make clean_data
``` 
^ this will remove created volumes, networks, images, as well as respective directories for the database and wordpress files.  
!! CAREFUL !!  
the `make clean_data` will remove the directories from the host machine created for the database and wordpress files. Any changes made to the wordpress files will be lost. To change that remove or comment out the `rm -rf ...` lines from the `clean_data` directive in the Makefile.

```bash
make ls
``` 
^ this will list all the available images, running containers, volumes and custom made networks

```bash
make logs
``` 
^ this will show the logs of the running containers (if any). This might be helpful while debugging the containers.

#### NOTE   
Credentials and passwords for all containers are stored in the `.env` file.  
It is highly recommended to change the values of the environment variables for more secure ones, as well as make `.env` file to be ignored by git for security.

After `make up` and waiting for all things to be installed and running (to check `make ls`),   
WordPress can be accessed at `http://localhost:8000`  
PhpMyAdmin is accessible at `http://localhost:8080`

==  
Created by: [svvoii](https://github.com/svvoii) for educational purposes.
