#!/bin/bash
pdftotext S1.pdf
pdftotext S2.pdf
tr -d " \t\n\014"<S1.txt>temp1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' temp1.txt
sed -i 's/ELEC/\nELEC/g' temp1.txt
sed -i 's/MA/\tMA/g' temp1.txt 
$(cat temp1.txt | grep MDL16CS > temp2.txt)

sed -i 's/MA101/\t/g' temp2.txt
sed -i 's/,PH100/\t/g' temp2.txt
sed -i 's/,BE110/\t/g' temp2.txt
sed -i 's/,BE10105/\t/g' temp2.txt
sed -i 's/,BE103/\t/g' temp2.txt
sed -i 's/,EE100/\t/g' temp2.txt
sed -i 's/,PH110/\t/g' temp2.txt
sed -i 's/,EE110/\t/g' temp2.txt
sed -i 's/,CS110/\t/g' temp2.txt
sed -i 's/(O)/10/g' temp2.txt
sed -i 's/(A+)/9/g' temp2.txt
sed -i 's/(A)/8/g' temp2.txt
sed -i 's/(B+)/7/g' temp2.txt
sed -i 's/(B)/6/g' temp2.txt
sed -i 's/(C)/5/g' temp2.txt
sed -i 's/(P)/4/g' temp2.txt
sed -i 's/(F)/0/g' temp2.txt
$(echo -n > SGPA1.txt)

while read line; do
	a=($line)
	MA101=`expr ${a[1]} \* 4`
	PH100=`expr ${a[2]} \* 4`
	BE110=`expr ${a[3]} \* 3`
	BE10105=`expr ${a[4]} \* 3`
	BE103=`expr ${a[5]} \* 3`
	EE100=`expr ${a[6]} \* 3`
	PH110=`expr ${a[7]} \* 1`
	EE110=`expr ${a[8]} \* 1`
	CS110=`expr ${a[9]} \* 1`
	ANS=`expr $MA101 + $PH100 + $BE110 + $BE10105 + $BE103 + $EE100 + $PH110 + $EE110 + $CS110`
	
	$(echo "${a[0]}" $(printf "%.1f" "$(echo "$ANS/23" | bc -l;)") >> SGPA1.txt)
done < temp2.txt 

tr -d " \t\n\014"<S2.txt>tem1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' tem1.txt
sed -i 's/ELEC/\nELEC/g' tem1.txt
sed -i 's/CY100/\tCY100/g' tem1.txt 
$(cat tem1.txt | grep MDL16CS > tem2.txt)

sed -i 's/CY100/\t/g' tem2.txt
sed -i 's/,BE100/\t/g' tem2.txt
sed -i 's/,EC100/\t/g' tem2.txt
sed -i 's/,CY110/\t/g' tem2.txt
sed -i 's/,EC110/\t/g' tem2.txt
sed -i 's/,MA102/\t/g' tem2.txt
sed -i 's/,BE102/\t/g' tem2.txt
sed -i 's/,CS100/\t/g' tem2.txt
sed -i 's/,CS120/\t/g' tem2.txt

sed -i 's/(O)/10/g' tem2.txt
sed -i 's/(A+)/9/g' tem2.txt
sed -i 's/(A)/8/g' tem2.txt
sed -i 's/(B+)/7/g' tem2.txt
sed -i 's/(B)/6/g' tem2.txt
sed -i 's/(C)/5/g' tem2.txt
sed -i 's/(P)/4/g' tem2.txt
sed -i 's/(F)/0/g' tem2.txt
$(echo -n > SGPA2.txt)

while read line; do
	b=($line)
	CY100=`expr ${b[1]} \* 4`
	BE100=`expr ${b[2]} \* 4`
	EC100=`expr ${b[3]} \* 3`
	CY110=`expr ${b[4]} \* 1`
	EC110=`expr ${b[5]} \* 1`
	MA102=`expr ${b[6]} \* 4`
	BE102=`expr ${b[7]} \* 3`
	CS100=`expr ${b[8]} \* 3`
	CS120=`expr ${b[9]} \* 1`
	ANSWER=`expr $CY100 + $BE100 + $EC100 + $CY110 + $EC110 + $MA102 + $BE102 + $CS100 + $CS120`
	
	$(echo "${b[0]}" $(printf "%.1f" "$(echo "$ANSWER / 24" | bc -l;)") >> SGPA2.txt)
done < tem2.txt 
paste SGPA1.txt SGPA2.txt | awk '{printf "%s %.1f\n",$1, ($2*23+$4*24)/47}' > CGPA.txt

$(cut -f 4- c4b.txt > c4b1.txt)

$(join <(sort CGPA.txt) <(sort SGPA1.txt) | join - <(sort SGPA2.txt) | join - <(sort c4b1.txt)  > RESULT.txt )

