echo "Enter 1st number"
read n1
echo "Enter the second number"
read n2
echo "Enter the third number"
read n3
if [ $n1 -gt  $n2 -a $n1 -gt $n3 ]
then
	#echo "$n1 is largest"
	max=$n1
elif [ $n2 -gt $n1 -a $n2 -gt $n3 ]
then
	#echo "$n2 is grater"
	max=$n2
else
	#echo "$n3 is grater"
	max=$n3
fi
echo -n "\nMAX( $n1 , $n2 , $n3): $max\n"
exit 0
