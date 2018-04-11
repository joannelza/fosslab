#!/usr/bin/perl

print "HELLO WORLD \n";

#basics of perl
#Basic datatypes: Scalars, Arrays, Hashes

#1.Scalars
$x=10;
$str="The valus of x is $x";
print "str: $str \n";

#2.Arrays
@array=(h,e,l,l,o);
print "array[2]= $array[2] \n";

#3.Hashes
%hash=('Physics'=>83 ,'Chemistry'=>94 ,'Maths'=>85 ); # This is how we create a hash.
print %hash;
print "\n Physics: $hash{'Physics'} \n";
#4 Concatenation
$str = "abc"."def";
print "Concatenated strings of abc, def : $str";

$add = 10 + 5;
$sub = 10 - 5;
$mul = 10 * 5;
$div = 10 / 5;
print "\nVarious operations : $add $sub $mul $div\n";

