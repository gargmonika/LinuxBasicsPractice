#!/bin/bash
#

<<functionexample
        function myfun(name age) {
	local name=$name
	local age=$age

	echo My name is $name
	echo My age is $age
}


myfun Monika 21
functionexample

myfun(){

	 name=$1
	 age=$3

	echo My name is $name 
	echo My age is $age
}


myfun Monika 21 5

city="toronto"
state="ontario"

#------------------acess argumants

echo Total Number of argumnets is "$#"
echo arguments are $@
