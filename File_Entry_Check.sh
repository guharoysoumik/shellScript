#CREATED BY AKANKSHA GUHA ROY
echo "\n\t\t\t*******************************************************"
echo "\n\t\t\tFILE INFORMATION KEPT IN THE FILE File_Entry_Check.txt"
echo "\n\t\t\t*******************************************************"
monitor_Folder_Name=$1

if [ ! -e $monitor_Folder_Name  ]
then
	echo  "$monitor_Folder_Name  does not exists.."
	exit 1
fi
	rm -f	./temp_Before_sort
	rm -f	./temp_After_sort
	rm -f	./File_Entry_Check.txt
	
	while [ 1 ]
	do
		#echo "Checking..."
		ls -l $monitor_Folder_Name | tr -s " " "|" | cut -d "|" -f 9 > ./temp_Before
		
		rm -f ./temp_1
		sort ./temp_Before > ./temp_1
		rm -f ./temp_Before
		mv ./temp_1 ./temp_Before_sort
		
		sleep 10
		
		ls -l $monitor_Folder_Name | tr -s " " "|" | cut -d "|" -f 9 > ./temp_After
		rm -f ./temp_2
		sort ./temp_After > ./temp_2
		rm -f ./temp_After
		mv ./temp_2 ./temp_After_sort		
		
		#comm -13 ./temp_Before_sort ./temp_After_sort  > /dev/null
		rm -f ./comp_Result.txt
		comm -13 ./temp_Before_sort ./temp_After_sort  > ./comp_Result.txt
		comp_Size=`stat -c '%s' ./comp_Result.txt`
		#echo "\nCompare Size: $comp_Size"
		if [ ! $comp_Size  -eq 0 ]
		then
			echo "\t\t\t\tNew Entry Found..."
			comm -13 ./temp_Before_sort ./temp_After_sort > ./new_File_List.txt
			#cat ./new_File_List.txt
			for fName in `cat ./new_File_List.txt`
			do
				echo "\t\t\t\tFile Name: $fName"
				echo "File name: $fName   Creation Time: `stat -c '%w' $fName | tr -s " " "|" | cut -d "|" -f 2`" >> ./File_Entry_Check.txt
			done
			
			rm -f ./new_File_List.txt
		fi
		
		rm -f  ./temp_Before_sort
		rm -f  ./temp_After_sort
	done

exit 0
