import os
from os import system, remove
from uuid import uuid4
from subprocess import PIPE, run
from tabulate import tabulate


def out(command):
    result = run(command, stdout=PIPE, stderr=PIPE, universal_newlines=True, shell=True)
    return result.stdout


repo=out('/bin/bash init_script.sh openregistry')
#print(repo)
repolist = repo.strip('][').split(', ') 
#print(repolist)

print(tabulate(repolist, tablefmt='html'))
#os.system("sudo docker ps -a")
#os.system("/bin/bash init_script.sh openregistry")
