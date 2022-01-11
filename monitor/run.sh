echo "###Generating Prometheus Hashed Password...###"
password=$(egrep ^PROM_ADMIN_PASS .env)
password=$(cut -d "=" -f2- <<< "$password")
hashedpass=$(echo "pip install bcrypt --disable-pip-version-check && python gen-pass.py \"$password\"" | docker run -i --rm --name my-running-script -v "$PWD/files/prometheus/gen-pass.py":/usr/src/myapp/gen-pass.py -w /usr/src/myapp docker.my4030.ir/python:3 /bin/bash)
hashedpass=${hashedpass##*$'\n'}
echo -en "basic_auth_users:\n  admin: $hashedpass" > files/prometheus/web.yml
###
echo "###Inserting Prometheus Password into Grafana's datasource...###"
sed -E -i "s/basicAuthPassword: (.*)/basicAuthPassword: $password/g" files/grafana/provisioning/datasources/prometheus.yml
