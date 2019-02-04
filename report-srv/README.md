# readme

- copy these files to the directoy where the afl output directory is located
- edit `genreport.sh` and change the argument to afl-whatsup to point to the name of the output directory
- install a cronjob that cd's to the dir where the files are located and execute `genreport.sh`
- start the server

