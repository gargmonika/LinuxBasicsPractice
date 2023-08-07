##Problem Statement : Write a Scripti to Create a local User in a serevr with automatics generation of password for user.

## Requirements to Create Script:
#1)Script Should be Executed only from root user else exit with status 1 and error message
#2) script will take 1st argument as username and rest will be treated as comment
#3) Auto Generate Password for User
#4)Upon Successfull execution of the script, Display the following:
##    username : <username>
##    password : <password>
##    hostname : <hostname>

##-------------------------------------------------------------------------------------------------#####


## Solution:::

# Revision 1.0
# Sat Aug  5 12:45:40 PM EDT 2023
# !/bin/bash

#set -e           ### set -e stops the execution of a script if a command or pipeline has an error 


## only root user can execute the script:

if [ "$EUID" -ne 0 ]      #EUID(Effective User ID) of root and sudo user is 0.
then
	echo "Please run script as Root user"
	exit 1
fi

## Check if atleast one argument has been passed :

if [ -z "$1" ]		   ##  "-z" check is string is empty. 
then
	echo "username must be Provided to create user"
	exit 1
fi

#username and info about user:

username=$1
shift
comment=$*

##echo "username is $username"
##echo "info about user is :$comment"


## Generate Random Password for user
    ## pwgen is utility to generate random passwords. Install it using "apt-get install pwgen" on debaian system
    ## "-1" flag is to specify that only one password should be generated. You can Give a count of passwords as  you want to generate.
    ## "-B" flag to avoid including complex characters in password such as ||, 0 or O 

password=`pwgen -1 -B`

##echo "Password is $password"


#check if user already exists if yes, then print error message otherwise add new user.

egrep "^$username" /etc/passwd >/dev/null
 if [ $? -eq 0 ] 
 then
	echo "User "$username" already Exist"
	exit 1
 else
	 ## Create new user according to passed parameters

	  useradd -m -c "$comment" -s /bin/bash "$username"
	  [ $? -eq 0 ] && echo "User "$Username" has been added" || "Failed to add user "$username" "  ## "$?" is the character that gives the 													      exist status of last executed command.

 fi


##Set Password of user and  Force Password Change on First Login of user
echo "$username:$password" | chpasswd             ##This method adds Encryped Password for user
passwd -e "$username"

seq 3 | awk '{printf "\n"}'

## Display Information of user:
echo -e "username: \n"$username""
seq 2 | awk '{printf "\n"}'

echo -e "password: \n"$password""
seq 2 | awk '{printf "\n"}'

echo -e "hostname: \n`hostname` "
seq 2 | awk '{printf "\n"}'

echo -e "comment: \n"$comment""
seq 2 | awk '{printf "\n"}'

