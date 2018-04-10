clear
answer=0
a='y'

while [ $a != 'n' ]
do
echo "First number"
read n1
echo "Second number"
read n2

echo "MENU
	1.ADDITION
	2.SUBTRACTION
	3.MULTIPLICATION
	4.DIVISION
ENTER CHOICE:"
read c


if [ $c = "1" ]
then
answer=$((n1+n2))
echo "Result" $answer

elif [ $c = "2" ]
then
answer=$((n1-n2))
echo "Result" $answer

elif [ $c = "3" ]
then
answer=$((n1*n2))
echo "Result" $answer

elif [ $c = "4" ]
then
answer=$((n1/n2))
echo "Result" $answer

else :
echo "INVALID CHOICE"
fi

echo "Do you want to continue?(y/n)"
read a
if [ $a = "n" ]
then
exit
fi
done

