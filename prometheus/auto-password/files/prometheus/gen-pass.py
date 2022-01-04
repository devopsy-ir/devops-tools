import getpass
import bcrypt
import sys

#password = getpass.getpass("password: ")
#password="salam"
password = str(sys.argv[1])
print(password)
hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())
print(hashed_password.decode())
