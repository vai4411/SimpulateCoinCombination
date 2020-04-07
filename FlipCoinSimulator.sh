
#!/bin/bash -x

#Use case 1
COIN_SIDE=$((RANDOM % 2))
if [ $COIN_SIDE -eq 1 ]
then
        echo "Head wins"
else
        echo "Tail wins"
fi

#Use case 2
read -p "ENTER NO OF Flip:" FLIP
declare -A DIC
DIC[H]=0
DIC[T]=0
for ((TURN=0;TURN<$FLIP;TURN++))
do
	COIN_SIDE=$((RANDOM % 2))
	if [ $COIN_SIDE -eq 0 ]
	then
		VAL=${DIC[H]}
		DIC[H]=$((VAL+1))
	else
		VAL=${DIC[T]}
		DIC[T]=$((VAL+1))
	fi
done
VAL=${DIC[H]}
echo "Percent of heads is :" 
echo "scale=2;$VAL/$FLIP*100"|bc 
VAL=${DIC[T]}
echo "Percent of tails is :" 
echo "scale=2;$VAL/$FLIP*100"|bc

#Use case 3
DIC[HH]=0
DIC[TT]=0
DIC[TH]=0
DIC[HT]=0

for ((TURN=0; TURN<$FLIP; TURN++))
do
	COIN_SIDE=$((RANDOM%4))
	if [ $COIN_SIDE -eq 0 ]
	then
		VAL=${DIC[HH]}
		DIC[HH]=$((VAL+1))
	elif [ $COIN_SIDE -eq 1 ]
	then
		VAL=${DIC[TT]}
		DIC[TT]=$((VAL+1))
	elif [ $COIN_SIDE -eq 2 ]
	then
		VAL=${DIC[HT]}
		DIC[HT]=$((VAL+1))
	else
		VAL=${DIC[TH]}
		DIC[TH]=$((VAL+1))
	fi
done

echo "Percent of HH is :"
VAL=${DIC[HH]}
dic[HH]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[HH]}
echo "Percent of TT is :"
VAL=${DIC[TT]}
DIC[TT]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[TT]}
echo "Percent of HT is :"
VAL=${DIC[HT]}
DIC[HT]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[HT]}
echo "Percent of TH is :"
VAL=${DIC[TH]}
DIC[TH]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[TH]}

#Use case 4
DIC[TTT]=0
DIC[TTH]=0
DIC[THT]=0
DIC[HTT]=0
DIC[HTH]=0
DIC[HHT]=0
DIC[THH]=0
DIC[HHH]=0

for ((TURN=0; TURN<$FLIP ;TURN++))
do
	COIN_SIDE=$((RANDOM%8))
	if [ $COIN_SIDE -eq 0 ]
	then
		VAL=${DIC[TTT]}
		DIC[TTT]=$((VAL+1))
	elif [ $COIN_SIDE -eq 1 ]
	then
		VAL=${DIC[TTH]}
		DIC[TTH]=$((VAL+1))
	elif [ $COIN_SIDE -eq 2 ]
	then
		VAL=${DIC[THT]}
		DIC[THT]=$((VAL+1))
	elif [ $COIN_SIDE -eq 3 ]
	then
		VAL=${DIC[HTT]}
		DIC[HTT]=$((VAL+1))
	elif [ $COIN_SIDE -eq 4 ]
	then
		VAL=${DIC[HHT]}
		DIC[HHT]=$((VAL+1))
	elif [ $COIN_SIDE -eq 5 ]
	then
		VAL=${DIC[HTH]}
		DIC[HTH]=$((VAL+1))
	elif [ $COIN_SIDE -eq 6 ]
	then
		VAL=${DIC[THH]}
		DIC[THH]=$((VAL+1))
	else
		VAL=${DIC[HHH]}
		DIC[HHH]=$((VAL+1))
	fi
done


echo "Percent of TTT is :"
VAL=${DIC[TTT]}
DIC[TTT]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[TTT]}

echo "Percent of TTH is :"
VAL=${DIC[TTH]}
DIC[TTH]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[TTH]}

echo "Percent of THT is :"
VAL=${DIC[THT]}
DIC[THT]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[THT]}

echo "Percent of HTT is :"
VAL=${DIC[HTT]}
DIC[HTT]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[HTT]}

echo "Percent of HTH is :"
VAL=${DIC[HTH]}
DIC[HTH]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[HTH]}

echo "Percent of HHT is :"
VAL=${DIC[HHT]}
DIC[TTT]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[HHT]}

echo "Percent of THH is :"
VAL=${DIC[THH]}
DIC[THH]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[THH]}

echo "Percent of HHH is :"
VAL=${DIC[HHH]}
DIC[HHH]=`echo "scale=2;$VAL/$FLIP*100"|bc`
echo ${DIC[HHH]}

#Use case 5
Bubble () {
	ENTRY=0
	for ELEMENT in $@
	do
		ARR[$ENTRY]=`echo $ELEMENT | awk -F. '{print $1}'`
		ENTRY=$((ENTRY+1))
	done
	for ((ENTRY=0 ; ENTRY<$LENGTH ; ENTRY++))
	do
		for ((ELEMENT=0 ; ELEMENT<$LENGTH-ENTRY-1 ; ELEMENT++))
		do
			if ((${ARR[ELEMENT]} > ${ARR[$((ELEMENT+1))]} ))
			then
				TEMP=${ARR[j]}
				ARR[$ELEMENT]=${ARR[$((ELEMENT+1))]}
				ARR[$((ELEMENT+1))]=$TEMP
			fi
		done
	done
	echo "Sorted Values are : "${ARR[@]}
	MAX=${ARR[$((LENGTH-1))]}
	for ELEMENT in ${!DIC[@]}
	do
		DIC_VALUE=`echo ${DIC[$ELEMENT]} | awk -F. '{print $1}'`
		[ $DIC_VALUE -eq ${ARR[$((LENGTH-1))]} ] && echo "Winning Pair is :" $ELEMENT || continue
	done
}
LENGTH=${#DIC[@]}
Bubble ${DIC[@]}
