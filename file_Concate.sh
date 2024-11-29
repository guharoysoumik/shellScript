#THIS SCRIPT MERGE THE CONTENTS OF THE TWO FILE NAMES SUPPLIED AS INPUT
echo -n "\nEnter the File name1: "
read fileName1
echo -n "\nEnter the File name2: "
read fileName2
if [ -f $fileName1 -o  -f $fileName2 ]
then
	echo -n "\nFile name does not exists..."
	exit 1
fi

echo -n "\nEnter the Merged File Name: "
read fileName3
cat $fileName1 > ./temp.txt
cat $fileName2 >> ./temp.txt
mv ./temp.txt $fileName3
exit 0
#----End of the Script
