arg_num=$#
if [ "$arg_num" -lt 1 ]
then
    echo "Za malo argumentow"
    exit
fi

if [ ! -d $1 ]
then
    echo "Argument nie jest katalogiem"
    exit
fi

dir=$1

cd $dir
sub_directories=`ls -d *`

for sub_dir in $sub_directories
do
    if [ -d $sub_dir ]
    then
	cd $sub_dir
	mv ./* ../
	cd ..
	rmdir $sub_dir
    fi
done
