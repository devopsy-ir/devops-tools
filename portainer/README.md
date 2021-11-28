# In the name of ALLAH

## portainer
A complete docker compose file to run Portainer docker panel with
## How to use
Portainer uses hash of admin password. So, you must give it. In order to generate hash of a custom password hash and then set it in file '.env', you should run initialize script file at the beggining:<br/>
        1. Change admin **\<password\>**:<br/>
                `    PORTAINER_ADMIN_PASSWORD=`**`<password>`**<br/>
        2. Run the initialize file:<br/>
                `    /bin/sh ./init.sh`<br/>
        3. Run the container:<br/>
                `    docker-compose up -d`<br/>

Note: A new password does not affect a running portainer. You can only set admin password at the first run of the container!

# ya ALI
