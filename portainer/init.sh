#!/bin/sh
if [[ "$(docker images -q docker.mysite.ir/ict/httpd:2.4-alpine 2> /dev/null)" == "" ]]; then
	docker pull docker.mysite.ir/ict/httpd:2.4-alpine
fi
pass=$(fgrep PORTAINER_ADMIN_PASSWORD= .env | awk -F = '{print $2}')
pass_hash=$(docker run --rm docker.mysite.ir/ict/httpd:2.4-alpine htpasswd -nbB admin "$pass" | cut -d ":" -f 2)
sed "s#PORTAINER_ADMIN_PASSWORD_HASH=.*#PORTAINER_ADMIN_PASSWORD_HASH=${pass_hash}#g" ./.env -i
