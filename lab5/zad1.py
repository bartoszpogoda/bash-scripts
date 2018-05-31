#!/usr/bin/python3
import sys
import os

# create 10 files with arbitrary content in given directory

if len(sys.argv) != 2:
    print('Wrong number of arguments. Usage: zad1.py [directory]')
    sys.exit()

directory = sys.argv[1]

if not os.path.exists(directory):
    os.makedirs(directory)

for i in range(10):
    file = open(directory + '/' + str(i) + '.txt', 'a')
    file.write(str(i))
    file.close()