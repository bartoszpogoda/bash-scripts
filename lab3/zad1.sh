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

# Wyświetlić pliki: grupa ma prawa zapisu, inni prawa odczytu
# rwxrwxrwx - maska: ~~~~1~1~~ -> 000010100 -> 024 -> "-perm -024"
echo "1.a"
find $baseDir -type f -perm -024 -print | sort | tail -n 5

# Wyświetlić pliki o rozszerzeniu txt, modyfikowane mniej niż 5s temu ścieżki kanoniczne ale "/" -> "\"
echo "1.b"
#  tr "/" "\\"'
find $baseDir -name "*.txt" -newermt '5 seconds ago' | while read file
do
  realpath $file | tr '/' '\\'
done






# find /home/bpogoda/dev/so2-p -print | tail | while read var var2
# do
#   echo "var: "$var
#   echo "var2: "$var2
# done
