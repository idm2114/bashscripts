#!/bin/bash
#author: ian macleod
#highly inefficient bash script -- first attempt at automating subfolders

date=$(date +'%Y-%m-%d')
read Y M D <<< ${date//[-: ]/ }
DOW=$(date +%u)

#checking to see if the weekday is monday 
#only need to make new folders once a week
if [ $DOW -eq 1 ]
then
	echo "Let's try and make new folders!"
	number=1;
	while [ $number -lt 7 ]
	do
		#iterating through all files in laidlaw main folder
		for dir in /Users/ian/Desktop/laidlaw-program/*;
		do
			echo $dir
			if [ -d "$dir" ]
			then
				if [ -d "$dir/readings-week-$number" ]
				then
					echo "Directory exists."
					number=$(( number+1 ))
				else
					echo "Directory does not exist. Making directory now..."
					newdir="$dir/readings-week-$number"
					mkdir $newdir
				fi
			fi
		done
	done
else 
	echo "The program is only useful once a week. Come back and try again on Monday!"
fi

echo "program closed"
