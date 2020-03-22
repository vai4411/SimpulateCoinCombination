
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
read -p "Enter number of flips:" n
coin[head]=0
coin[tail]=0
for ((i=0; i<$n; i++))
do
	r=$((RANDOM % 2))
	if [ $r -eq 1 ]
	then
		head=$(($head + 1))
		coin[head]=$head
	else
		tail=$(($tail + 1))
		coin[tail]=$tail
	fi
done
headperc=`(echo 'scale=2;'${coin[head]}' / '$n' * 100' | bc)`
echo "Percentage of head $headperc"
tailperc=`(echo 'scale=2;'${coin[tail]}' / '$n' * 100' | bc)`
echo "Percentage of head $tailperc"
