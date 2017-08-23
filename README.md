# MacOS Block Lists
OSXCleaner is a set of scripts to clean system logs, application caches, cookies and more on MacOS.

## Usage
### Downloading the lists
Execute the download.sh script first to download all of the lists.

	bash download.sh

### Converting the lists to other formats
It will convert each list to every format possible. For instance, should a list have the 0.0.0.0 hosts format for hostname filtering, then it will convert it into the 127.0.0.1 hosts format and create another list for DNS blocking. Lists can be found in the `built` directory.

	bash build.sh

### Concat files
To combine multiple blocklists in the same format, use the `concat.sh` script. Replace `OUTPUT.txt` with any other file name. This created file will contain the final list. Files can be found in the `concat/` directory.

You can comment out lists in the `concat.sh` file to only combine specific lists.

#### 0.0.0.0 hosts

	bash concat.sh 0hosts OUTPUT.txt

#### 127.0.0.1 hosts

	bash concat.sh hosts OUTPUT.txt

#### domains

	bash concat.sh domains OUTPUT.txt

#### cidr

	bash concat.sh cidr OUTPUT.txt

#### IPs

	bash concat.sh ip_list OUTPUT.txt

#### IP Ranges

	bash concat.sh ranges OUTPUT.txt

### Using Gas Mask?
If you are using Gas Mask on MacOS for managing hosts files, simply execute the `gasmask_install.sh` script and it will automatically add them to Gas Mask. Remember to download and build first.

To update them in the future, just execute the script. No additional configuration is needed for the updates.

	bash download.sh
	bash build.sh
	bash gasmask_install.sh

## License
MIT License - Copyright (c) 2017 Harvey Eckstein
