#
#!/bin/bash -x

#Use case 1
r=$((RANDOM % 2))
if [ $r -eq 1 ]
then
        echo "Head wins"
else
        echo "Tail wins"
fi

#Use case 2
read -p "ENTER NO OF Flip:" flip
declare -A dic
dic[H]=0
dic[T]=0
for ((i=0;i<$flip;i++))
do
	r=$((RANDOM % 2))
	if [ $r -eq 0 ]
	then
		val=${dic[H]}
		dic[H]=$((val+1))
	else
		val=${dic[T]}
		dic[T]=$((val+1))
	fi
done
val=${dic[H]}
echo "Percent of heads is :" 
echo "scale=2;$val/$flip*100"|bc 
val=${dic[T]}
echo "Percent of tails is :" 
echo "scale=2;$val/$flip*100"|bc

#Use case 3
dic[HH]=0
dic[TT]=0
dic[TH]=0
dic[HT]=0

for ((i=0;i<$flip;i++))
do
	r=$((RANDOM%4))
	if [ $r -eq 0 ]
	then
		val=${dic[HH]}
		dic[HH]=$((val+1))
	elif [ $r -eq 1 ]
	then
		val=${dic[TT]}
		dic[TT]=$((val+1))
	elif [ $r -eq 2 ]
	then
		val=${dic[HT]}
		dic[HT]=$((val+1))
	else
		val=${dic[TH]}
		dic[TH]=$((val+1))
	fi
done

echo "Percent of HH is :"
val=${dic[HH]}
dic[HH]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[HH]}
echo "Percent of TT is :"
val=${dic[TT]}
dic[TT]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[TT]}
echo "Percent of HT is :"
val=${dic[HT]}
dic[HT]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[HT]}
echo "Percent of TH is :"
val=${dic[TH]}
dic[TH]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[TH]}

#Use case 4
dic[TTT]=0
dic[TTH]=0
dic[THT]=0
dic[HTT]=0
dic[HTH]=0
dic[HHT]=0
dic[THH]=0
dic[HHH]=0

for ((i=0;i<$flip;i++))
do
	r=$((RANDOM%8))
	if [ $r -eq 0 ]
	then
		val=${dic[TTT]}
		dic[TTT]=$((val+1))
	elif [ $r -eq 1 ]
	then
		val=${dic[TTH]}
		dic[TTH]=$((val+1))
	elif [ $r -eq 2 ]
	then
		val=${dic[THT]}
		dic[THT]=$((val+1))
	elif [ $r -eq 3 ]
	then
		val=${dic[HTT]}
		dic[HTT]=$((val+1))
	elif [ $r -eq 4 ]
	then
		val=${dic[HHT]}
		dic[HHT]=$((val+1))
	elif [ $r -eq 5 ]
	then
		val=${dic[HTH]}
		dic[HTH]=$((val+1))
	elif [ $r -eq 6 ]
	then
		val=${dic[THH]}
		dic[THH]=$((val+1))
	else
		val=${dic[HHH]}
		dic[HHH]=$((val+1))
	fi
done


echo "Percent of TTT is :"
val=${dic[TTT]}
dic[TTT]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[TTT]}

echo "Percent of TTH is :"
val=${dic[TTH]}
dic[TTH]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[TTH]}

echo "Percent of THT is :"
val=${dic[THT]}
dic[THT]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[THT]}

echo "Percent of HTT is :"
val=${dic[HTT]}
dic[HTT]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[HTT]}

echo "Percent of HTH is :"
val=${dic[HTH]}
dic[HTH]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[HTH]}

echo "Percent of HHT is :"
val=${dic[HHT]}
dic[TTT]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[HHT]}

echo "Percent of THH is :"
val=${dic[THH]}
dic[THH]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[THH]}

echo "Percent of HHH is :"
val=${dic[HHH]}
dic[HHH]=`echo "scale=2;$val/$flip*100"|bc`
echo ${dic[HHH]}

#Use case 5
bubble () {
	k=0
	for i in $@
	do
		arr[$k]=`echo $i | awk -F. '{print $1}'`
		k=$((k+1))
	done
	for ((i=0 ; i<$len ; i++))
	do
		for ((j=0 ; j<$len-i-1 ; j++))
		do
			if ((${arr[j]} > ${arr[$((j+1))]} ))
			then
				temp=${arr[j]}
				arr[$j]=${arr[$((j+1))]}
				arr[$((j+1))]=$temp
			fi
		done
	done
	echo "Sorted Values are : "${arr[@]}
	max=${arr[$((len-1))]}
	for i in ${!dic[@]}
	do
		dicValue=`echo ${dic[$i]} | awk -F. '{print $1}'`
		[ $dicValue -eq ${arr[$((len-1))]} ] && echo "Winning Pair is :" $i || continue
	done
}
len=${#dic[@]}
bubble ${dic[@]}
