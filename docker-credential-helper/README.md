# Ref: https://stackoverflow.com/a/56962332/659077

secretservice requires a GUI. You can use pass without a GUI.

Unfortunately, Docker's documentation on how to configure Docker Credential Helpers is quite lacking. Here's a comprehensive guide how to configure pass with Docker (tested with Ubuntu 18.04):

1. Install the Docker Credential Helper for pass
Find the url for the latest version of docker-credential-pass from https://github.com/docker/docker-credential-helpers/releases . For example:
	# substitute with the latest version
	url=https://github.com/docker/docker-credential-helpers/releases/download/v0.6.2/docker-credential-pass-v0.6.2-amd64.tar.gz

	# download and untar the binary
	wget $url
	tar -xzvf $(basename $url)

	# move the binary to a dir in your $PATH
	sudo mv docker-credential-pass /usr/local/bin

	# verify it works
	docker-credential-pass list

2. Install and configure pass
	apt install pass

	# create a gpg2 key
	gpg2 --gen-key
	# if you have issues with lack of entropy, "apt install haveged" and try again

	# create the password store using the gpg user id above
	pass init $gpg_id

3. docker login
	docker login

	# You should not see any credentials stored in "auths" section.
	# "credsStore": "pass" should have been automatically added.
	# If the value is "secretservice", replace it with "pass".
	cat ~/.docker/config.json

	# verify credentials stored in `pass` store now
	pass
