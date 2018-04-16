arg_num=$#
if [ "$arg_num" -lt 1 ]
then
    echo "Za malo argumentow"
    exit
fi

baseDir=$1
if [ ! -d $baseDir ]
then
    echo "Argument nie jest katalogiem"
    exit
fi

# List files with write right for group and read right for others (sorted, last 5)
# rwxrwxrwx - mask: ~~~~1~1~~ -> 000010100 -> 024 -> "-perm -024"
echo "1.a"
find $baseDir -type f -perm -024 -print | sort | tail -n 5

# List files with .txt extension modified within last 5 seconds. Print their canonical paths but with / subsituted with \.
echo "1.b"
find $baseDir -name "*.txt" -newermt '5 seconds ago' | while read file
do
  realpath $file | tr '/' '\\'
done
