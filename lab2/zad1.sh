# Remove dir lab2 if it exists
if [ -e lab2 ]; then
  rm -rf lab2
fi

# Create directory structure
mkdir lab2
mkdir lab2/a
mkdir lab2/e
mkdir lab2/a/b
mkdir lab2/a/c
mkdir lab2/a/c/d

# Create files
echo "test plik1" > lab2/a/b/plik1
echo "test plik2" > lab2/a/b/plik2
echo "test plikA" > lab2/e/plikA
echo "test plikB" > lab2/e/plikB

# Create links
links_dir=lab2/a/c/d

# Create links (relative)
ln -s ../../b/plik1 ${links_dir}/link_plik1
ln -s ../../../e/plikA ${links_dir}/link_plikA
ln -s ../../b ${links_dir}/link_b

# Create links (absolute)
ln -s `realpath lab2/a/b/plik2` ${links_dir}/link_plik2_bez
ln -s `realpath lab2/e/plikB` ${links_dir}/link_plikB_bez
ln -s `realpath lab2/a/b/plik1` ${links_dir}/link_plik1_bez
