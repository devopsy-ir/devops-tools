# docker-ansible
An Ansible playbook for installing Docker on Ubuntu

[@dwsclass](https://github.com/dwsclass) dws-ops-002-docker-ansible

Task 'apt update --allow-release-change' added since the following error:
	fatal: [IP]: FAILED! => {"changed": false, "msg": "Failed to update apt cache: W:This must be accepted explicitly before updates for this repository can be applied. See apt-secure(8) manpage for details., W:Repository 'http://deb.debian.org/debian buster InRelease' changed its 'Version' value from '10.7' to '10.12', E:Repository 'http://deb.debian.org/debian buster InRelease' changed its 'Suite' value from 'stable' to 'oldstable', W:This must be accepted explicitly before updates for this repository can be applied. See apt-secure(8) manpage for details., E:Repository 'http://security.debian.org/debian-security buster/updates InRelease' changed its 'Suite' value from 'stable' to 'oldstable', W:This must be accepted explicitly before updates for this repository can be applied. See apt-secure(8) manpage for details., E:Repository 'http://deb.debian.org/debian buster-updates InRelease' changed its 'Suite' value from 'stable-updates' to 'oldstable-updates'"}
