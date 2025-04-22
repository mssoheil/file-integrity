# Simple file integrity checker bash script

## Usage
add the relative path of the file that you want the hash list store inside it against the Home directory inside the file-hash-path.txt beside the main.sh file
the hash of the files will be added to that file
If that file doesn't exist the script will create it.
next choose the operation of add or check
If you choose "add" the script will ask for the file that you want to add to the list of hash files

If you choose "check" the script will ask for the file and if the file exist and its hash has been added to the hash list it will check to see wheather the file has been changed or not
