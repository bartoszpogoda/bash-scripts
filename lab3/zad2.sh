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

echo "2.b"
find $baseDir -maxdepth 3 -name "*.txt" -newermt '5 seconds ago' -printf '%TY-%Tm-%Td|%TT %p\n' | while read dateTime fileName
do
  echo `realpath $fileName`"|"$dateTime
done | tee result

echo "2.c"
cat result | while read line
do
  # nazwa pliku
  absolutePath=`echo $line  | cut -d '|' -f 1`
  echo `basename $absolutePath`
  date=`echo $line  | cut -d '|' -f 2`

  # date z zamienionym - na .
  echo `echo $date | tr '-' '.'`
  vtime=`echo $line  | cut -d '|' -f 3`

  # min
  echo `echo $vtime | cut -d ':' -f 2`

  # sec
  echo `echo $vtime | cut -d ':' -f 3`
  echo ""

done





# find /home/bpogoda/dev/so2-p -print | tail | while read var var2
# do
#   echo "var: "$var
#   echo "var2: "$var2
# done
