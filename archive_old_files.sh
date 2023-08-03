### Problem Statement -In a given directory,  Find the files which has size of or more than 20mb or files oled than given days ex:10 days, then move them to archive folder.

#!/bin/bash

##check if there is user given directory available:
#echo "Please enter the path of directory from which you want to move files."
#read dir
dir=/home/manu02/scripts
#Declare Variables
depth=1


##sudo find / -type d -name $dir 2>/dev/null

#check if given directory exist
if [ ! -d $dir ]
then
	echo "Directory does not exist:$dir"
	exit 1
fi

#check id archive folder is present if not then create it

if [ ! -d $dir/archive ]
then
	mkdir $dir/archive
	exit 1
fi

#check the files more than size of 20 MB, if exist identify those files and move to archive folder.

for i in `find $dir -maxdepth $depth -type f -size +20M`
do
       gzip $i ||exit 1     #compress file using gzip utility
       mv $i.gz $dir/archive ||exit 1     #move file to archive folder
     #print success log message on terminal
       echo "$(date) -- Compressed and archived $i ==> $i.gz"

       ## if no files found print message::

       if [[ -z "{$i}" ]]     # -z flag is used to check if element is empty
       then
	       echo "There are no files bigger than 20MB of Size"
       fi

done


