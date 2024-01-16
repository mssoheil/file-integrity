#!/bin/bash

configPath="./files-hash-path.txt"

if [ ! -f $configPath ]; then
	echo "the config file does not exist"
	exit 2
fi

hashListRelativePath=$(cat $configPath)

hashList="$HOME/$hashListRelativePath"

if [ ! -f $hashList ]; then
	touch $hashList
        echo "the hash list file created"
fi

read -p "what is the operation? (add/check): " operation

if [ $operation = "add" ]; then
	
	read -p "add file to integrety check list: " file
	filePath=$(readlink -f $file)
	md5=$(md5sum $filePath | awk '{printf $1}')
	echo "$filePath:$md5" >> $hashList
fi







