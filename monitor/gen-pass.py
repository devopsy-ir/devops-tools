import getpass
import bcrypt
import sys

#password = getpass.getpass("password: ")
#password="salam"
password = str(sys.argv[1])
print(password)
hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())
print(hashed_password.decode())

original_stdout = sys.stdout # Save a reference to the original standard output

with open('/usr/src/myapp/web.yml', 'w') as f:
    sys.stdout = f # Change the standard output to the file we created.
    print('basic_auth_users:\n  admin: ' + hashed_password.decode())
    sys.stdout = original_stdout
