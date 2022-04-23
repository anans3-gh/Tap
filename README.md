# Tap Creators
maketap.sh and tapcreator.sh are part of a project to allow for the easy creation of tap interfaces on Ubuntu for network based testing.
e.g. you are working with gns3 network and require an interface from your host machine to interact with the gns3 based network.

1. It requires as a pre-requisite the installation of the below packages:
     ```
     sudo apt-get install uml-utilities bridge-utils
     ```

2. Subsequently just run the script with sudo and you should be done.

     ```
     sudo maketap.sh
     ```
     or
     
     ```
     sudo tapcreator.sh
     ```

> NB: I have only tested this on Ubuntu 18.04 but I am sure it will work on any other Debian variants.

