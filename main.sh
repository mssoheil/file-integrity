#!/bin/bash

configPath="./files-hash-path.txt"

addFileHash(){

	read -p "add file to integrety check list: " file
        local filePath=$(readlink -f $file)

	if [ ! -f $filePath ]; then
		echo "file doesn't exist"
		exit 2
	fi

        local md5=$(md5sum $filePath | awk '{printf $1}')
        echo "$filePath:$md5" >> $hashList
	echo "file added to hash list"
        exit 1
}

checkFileIntegrity() {
	read -p "type file to check integrity of: " file
        local filePath=$(readlink -f $file)


	if [ ! -f $filePath ]; then
                echo "file doesn't exist"
                exit 2
        fi

	local md5=$(md5sum $filePath | awk '{printf $1}')

	local foundHash=$(cat $hashList | grep $filePath)

	if [ ! $foundHash != 0 ]; then
		echo "first add the file to hash list then check again"
		exit 2
	fi

	local hash=$(echo $foundHash | awk -F ':' '{printf $2}')

	if [ $hash != $md5 ]; then
		echo "The file has been changed"
		exit 2
	fi

	echo "The file has not been changed"
	exit 1
}

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
	addFileHash
fi

checkFileIntegrity

echo $operation









