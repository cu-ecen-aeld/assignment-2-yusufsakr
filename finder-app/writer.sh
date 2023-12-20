#!/bin/sh

writefile=$1
writestr=$2

dir=$(dirname "$writefile")
filename=$(basename "$writefile")

echo "Directory is : $dir"
echo "File name is : $filename"

if [ $# != 2 ]
then
    echo "Lack of Arguments"
    exit 1
fi

if [ -d "$dir" ]
then
    sudo chmod 777 $dir    
    sudo touch $writefile

    if [ $? -eq 1 ]
    then 
        echo "Could not Create the File 1"
        exit 1
    fi

    sudo chmod 777 $writefile 
    echo $writestr > $writefile 
    exit 0
else
    sudo mkdir -p $dir

    if [ $? -eq 1 ]
    then 
        echo "Could not Create the Directory"
        exit 1
    fi

        echo "Directory Created Succesfully"
        sudo chmod 777 $dir
        sudo touch $writefile

    if [ $? -eq 1 ]
    then 
        echo "Could not Create the File"
        exit 1
    fi

    sudo chmod 777 $writefile 
    echo $writestr > $writefile 
    exit 0
fi

exit 0