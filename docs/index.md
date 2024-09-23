# Documentation

Musicbox is a program writen in bash that will play audio either provided by the user or downloaded from youtube at an specified time

## Index

* [Instalation](#Instalation)
* [Usage](#Usage)
* [Developer information](#Developer-Information)
* [License](../COPYING)

## Instalation
Installing musicbox is as simple as following these 8 simple steps
### Local
1. Create Google API credentials, see: [Create Google API credentials in 50 easy steps](https://github.com/glotlabs/gdrive/blob/main/docs/create_google_api_credentials.md)
1. Setup [gdrive](https://github.com/glotlabs/gdrive) on a local system, a web browser is required
3. Export the account to a file and move it to the system you will be running musicbox on
### Remote
4. Install docker and docker compose and enable the docker daemon service (not the socket!)
5. Clone this repository
   `git clone https://github.com/TheRedCyclops/musicbox`
6. Change your working directory to the newly cloned repository
   `cd musicbox`
7. Open docker-compose.yml with your favorite text editor and set MUSICBOX_GDRIVE_TAR to the full path to the file you exported previously 
8. execute the following command to start musicbox, it will also restart automatically on boot
   `docker compose up -d`

To stop musicbox run the following while in the the folder of the directory:
   `docker compose down`

## Usage
## Developer Information
## Roadmap
- [ ] Add usage instructions
- [ ] Add troubleshooting instructions
- [ ] Add developer information
- [ ] Automatically create all needed files in google drive
- [ ] Add a run test to the precommit unit tests (currently manually run)
- [ ] Delay cleanup until all downloaded files are validated
- [ ] Move all parts of the build script to the docker file
- [ ] Support architectures other than amd64

