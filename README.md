# File Integrity Checker
A simple Bash script designed to verify the integrity of files by computing and comparing their SHA-256 hashes. It allows users to add files to a hash list and subsequently check if they have been altered.

### Features
- Add Files to Hash List: Compute and store the SHA-256 hash of specified files.
- Verify File Integrity: Check if the current hash of a file matches the stored hash, indicating whether the file has been modified.
- Automatic Hash List Management: If the hash list file does not exist, it will be created automatically.

### Usage
- Clone the Repository
- Add the relative path of the file that you want the hash list stored inside it against the Home directory inside the `file-hash-path.txt` beside the `main.sh` file
- If the specified file does not exist, it will be created automatically when you add a file
- Run the Script `./main.sh`
- The script will prompt you to choose an operation: `add` or `check`
- If you choose `add`, the script will ask for the file that you want to add to the list of hash list. It then computes the SHA-256 hash of the file and stores it in the specified hash list file
- If you choose `check`, the script will ask for the path of the file you want to verify, and if the file exists and its hash has been added to the hash list, it will check to see whether the file has been changed or not. The script will inform you whether the file has been modified

