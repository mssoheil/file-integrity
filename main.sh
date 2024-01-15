#!/bin/bash

echo "heelo"
read -p "what is the operation? (add/check): " operation
echo "operation: $operation"

configPath=$(cat /home/pasbakhsh/file-hash-list/list.txt)
echo $configPath

if [ $operation = "add" ]; then
	
	read -p "add file to integrety check: " file
	filePath=$(readlink -f $file)
	md5=$(md5sum $filePath)
	echo $filePath
	echo $md5
	echo "$filePath:$md5" >> $configPath 
fi







