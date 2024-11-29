limit=$1
for i in `seq 1 1 $limit`
do
	echo  -n "\n"
	b_limit=`expr $limit - $i `
	for b in `seq 1 1 $b_limit`
	do
		echo -n " "
	done
	s_limit=`expr $i \* 2`
	s_limit=`expr $s_limit - 1`
	
	for s in `seq 1 1 $s_limit`
	do
		echo -n "X"
	done
done 
exit 0
