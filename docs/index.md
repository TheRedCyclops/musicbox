# Documentation

Musicbox is a program writen in bash that will play audio either provided by the user or downloaded from youtube at an specified time

## Index

* [Instalation](#Instalation)
* [Usage](#Usage)
* [Developer information](#Developer-Information)

## Instalation

Currently musicbox has only been tested on debian stable

Installing musicbox is as simple as following these steps

1. Install on a system with a browser and a graphical UI [gdrive](https://github.com/glotlabs/gdrive)
2. Log in or create the google account to be used with musicbox
3. Export the account to a file
4. Clone this repository
   `git clone https://github.com/Glich440/musicbox`
5. Change your working directory to the newly cloned repository
   `cd musicbox`
6. Create a folder called "creds"
   `mkdir creds`
7. Copy or move the account file that was exported to this folder
8. Change any preferences in the setup by editing scripts/musicbox-env
9. Run the installation script with root permisions at scripts/setup/install
   `sudo ./scripts/setup/install`
10. Done!
