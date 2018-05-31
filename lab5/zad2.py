#!/usr/bin/python3
import sys
import os

# move all executables from one directory to the other (fromDir -> toDir)

def make_dir_if_doesnt_exist(dirpath):
    if not os.path.exists(dirpath):
        os.makedirs(dirpath)

if len(sys.argv) != 3:
    print('Wrong number of arguments. Usage: zad1.py [fromDir] [toDir]')
    sys.exit()

from_dir = sys.argv[1]
to_dir = sys.argv[2]

make_dir_if_doesnt_exist(from_dir)
make_dir_if_doesnt_exist(to_dir)

for filename in os.listdir(from_dir):
    path = os.path.join(from_dir, filename)
    if os.path.isfile(path):
        if os.access(path, os.X_OK):
            os.rename(path, os.path.join(to_dir, filename))