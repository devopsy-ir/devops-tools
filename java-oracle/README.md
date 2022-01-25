# Oracle Java
Steps to build Java docker image:

Step 1. Copy file .env.example into .env and change Java version in it. Also not to forget to fill proxy setttings (Proxy `URL:PORT`), if you are behind a proxy or you want to bypass your location limitations.

Step 2. Download manually Java bin file (e.g. file 'jdk-11.0.13_linux-x64_bin.tar.gz') and put it inside this directory. 

Step 3. Build Java docker image: `docker-compose build`
