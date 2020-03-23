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
