#! /bin/bash

path=~/Desktop/studia/inzynier/semestr3/akiso/laby/lista4
touch $path/chuck.txt
curl -o $path/chuck.txt https://api.chucknorris.io/jokes/random &>/dev/null
touch $path/img1.txt
curl -o $path/img1.txt https://api.thecatapi.com/v1/images/search &>/dev/null
sed -i 's/"/ /g' img1.txt
text=`cat img1.txt`
array=( $text )
link=${array[7]}
touch $path/temp.txt
echo $link > temp.txt
name=`sed -i 's/\// /g' temp.txt | awk '/images/ {print $4}' $path/temp.txt`
touch $path/$name
curl -o $path/$name $link &> /dev/null
sed -i 's/"/ /g' chuck.txt
text=`cat chuck.txt`
array=( $text )
link=${array[7]}
new=`curl https://api.chucknorris.io/jokes/random | jq '.value'`
catimg $path/$name
echo $new
rm $path/chuck.txt
rm $path/img1.txt
rm $path/temp.txt
rm $path/$name
