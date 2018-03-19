# Skrypt nr 11, bpogoda

if [ "$#" -lt 2 ]
then
    echo "usage: zad11 list_input output_file"
    echo "   list_input: file containing list of files to match"
    echo "   dir_input: directory to check"
    exit
fi

if [ ! -f $1 ]
then
    echo "usage: zad11 list_input output_file"
    echo "   list_input: file containing list of files to match"
    echo "   dir_input: directory to check"
    exit
fi

if [ ! -d $2 ]
then
    echo "usage: zad11 list_input output_file"
    echo "   list_input: file containing list of files to match"
    echo "   dir_input: directory to check"
    exit
fi

file=$1
dir=$2

echo "Pliki będące na liście a nieobecne w katalogu: "
comm -1 -3 <(ls $dir) <(sort $file)
echo ""

echo "Pliki będące w katalogu a nieobecne na liście: "
comm -2 -3 <(ls $dir) <(sort $file)
echo ""
