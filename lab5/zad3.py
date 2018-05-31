#!/usr/bin/python3
import sys
import os
import shutil

# remove all sub-directories within given directory (dir), 
# but preserve (copy) all *.txt files to the other directory (backupDir)
# check only one level deep (not recursive)

# EXAMPLE:
# before:
#   dir/    
#       subDirA/
#           file.exe
#           text.txt
#       subDirB/
#           textB.txt
#       fileB.exe
#       textC.txt
#
#   backupDir/

# usage:
#   zad1.py dir backupDir

# after:
#   dir/     
#       fileB.exe
#       textC.txt
#   
#   backupDir/
#       text.txt
#       textB.txt      

def make_dir_if_doesnt_exist(dirpath):
    if not os.path.exists(dirpath):
        os.makedirs(dirpath)

if len(sys.argv) != 3:
    print('Wrong number of arguments. Usage: zad1.py [dir] [backupDir]')
    sys.exit()

dir = sys.argv[1]
backup_dir = sys.argv[2]

for filename in os.listdir(dir):
    path = os.path.join(dir, filename)

    if os.path.isdir(path):
        for subdir_filename in os.listdir(path):
            if subdir_filename.lower().endswith('.txt'):
                os.rename(os.path.join(path, subdir_filename), os.path.join(backup_dir, subdir_filename))

        shutil.rmtree(path)