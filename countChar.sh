myString=$1
no_Chars=`echo $myString | wc -c`
no_Chars=`expr $no_Chars - 1`
echo -e "\nString: $myString\t Length: $no_Chars"
echo ${#myString}
len=`expr length  "$myString"`
echo -e "\nLength: $len"
exit 0
