#!/bin/sh

filesdir=$1
searchstr=$2

if [ $# != 2 ]
then
    echo "Lack of Arguments"
    exit 1
elif [ -d "$filesdir" ]
then    
    files_count=$(ls -r $filesdir | wc -l)
    lines_count=$(grep "$searchstr"* $filesdir -r  | wc -l)
    echo "The number of files are $files_count and the number of matching lines are $lines_count"
    exit 0
else
    echo "Directory not found"
    exit 1
fi

#Lankash
#lalala
