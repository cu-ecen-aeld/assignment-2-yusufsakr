#!/bin/sh

writefile=$1
writestr=$2

dir=$(dirname "$writefile")
filename=$(basename "$writefile")

if [ $# != 2 ]
then
    echo "Lack of Arguments"
    exit 1
fi

if [ -d "$dir" ]
then    
    touch $writefile

    if [ $? -eq 1 ]
    then 
        echo "Could not Create the File 1"
        exit 1
    fi

    sudo chmod 777 $writefile 
    echo $writestr > $writefile 
    exit 0
else
    mkdir $dir

    if [ $? -eq 1 ]
    then 
        echo "Could not Create the Directory"
        exit 1
    fi

        touch $writefile

    if [ $? -eq 1 ]
    then 
        echo "Could not Create the File"
        exit 1
    fi

    sudo chmod 777 $writefile 
    echo $writestr > $writefile 
    exit 0
fi