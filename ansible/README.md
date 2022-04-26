- [Install multiple apt packages](#Install multiple apt packages)
- [Remove file](#Remove file)

## Install multiple apt packages
You need to pass packages' names into `pkg` of module `apt`
```yaml
- name: Install apt packages
  become: true
  apt:
    update_cache: true
    cache_valid_time: 3600 # Update the apt cache only if it’s older than 3,600 seconds (1 hour).
    pkg:
      - acl
      - git
      - libjpeg-dev
      - libpq-dev
      - memcached
      - nginx
      - postgresql
      - python3-dev
      - python3-pip
      - python3-venv
      - python3-psycopg2
      - supervisor
```

## Remove file

To remove a file:
```yaml
- name: Remove default nginx conf
  become: true
  file:
    path: /etc/nginx/sites-enabled/default
    state: absent
```
