f_dir=lab2/f

# Clean after previous script run
if [ -e $f_dir/copied_pointed_by_link_plik1 ]; then
  rm -rf $f_dir/copied_pointed_by_link_plik1
fi

if [ -e $f_dir/copied_link_plikB_bez ]; then
  rm $f_dir/copied_link_plikB_bez
fi

# Invoke first script
./zad1.sh

# Create new directory
mkdir $f_dir

# Copy file pointed by link
cp lab2/a/c/d/link_plik1 $f_dir/copied_pointed_by_link_plik1

# Copy symbolic link
cp -d lab2/a/c/d/link_plikB_bez $f_dir/copied_link_plikB_bez

# Find links that point to "plik1" within lab2/a/c/d directory
d_dir=lab2/a/c/d
d_contents=`ls $d_dir`
target_link=`realpath lab2/a/b/plik1`
echo "Znalezione dowiazania symboliczne do pliku plik1: "
for file in $d_contents; do
  if [ -h $d_dir/$file ]; then
    abs_link=`readlink -f $d_dir/$file`
    if [ $target_link = $abs_link ]; then
      echo $d_dir/$file
    fi
  fi
done
