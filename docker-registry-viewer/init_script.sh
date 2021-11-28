#!/bin/bash
if [ $# -eq 1 ]
then
	docker exec -it $1 ls -a /var/lib/registry/docker/registry/v2/repositories/
elif [ $# -eq 2 ]
then
	docker exec -it $1 ls -a /var/lib/registry/docker/registry/v2/repositories/$2/_manifests/tags
fi
