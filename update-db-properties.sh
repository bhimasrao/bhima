#!/bin/sh
#1st change
#read ip address from the file path


file1=`find /home/Appstore/ -iname "appstore.properties"`

#replace ip address with localhost.
sed -i.bak 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/localhost/' $file1


#replace port number from the file.
#echo "enter the tomcat port number u need to edit"
#read port1
sed -i.bak 's/'$port1'/8080/' $file1

#2nd change

#read ip address from the file path.


file2=`find /home/Appstore/ -iname "sso.properties"`

#replace ip address with server ip.
ip=`curl ifconfig.me`
sed -i.bak 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/'$ip'/' $file2


#replace port number from the file.
echo "enter the tomcat port number u need to edit"
read port1
sed -i.bak 's/'$port1'/8080/' $file2


#3rd change
#read ip address from the file path.


file3=`find /home/Appstore/ -iname "mongo.properties"`

#replace ip address with localhost.
sed -i.bak 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/localhost/' $file3


#replace port number from the file.
echo "enter the monogdb port number u need to edit"
read port3
sed -i.bak 's/'$port3'/27017/' $file3

#4th change
#read hcp.property file address from the file path


file5=`find /home/Appstore/ -iname "hcp.properties"`

#replace user and passwd
echo "enter the user name to change for mysql"
read uname
echo "enter the password need to change for mysql"
read passwd
sed -i.bak 's/'$uname'/admin/' $file5
sed -i.bak 's/'$passwd'/admin/' $file5


#replace port number from the file.
echo "enter the mysql port number u need to edit"
read port4
sed -i.bak 's/'$port4'/3306/' $file5


#Verifying the login page if tomcat starts up successfully.
curl localhost:8080 > log
if( test $? -eq 0 ) then
echo "tomcat succesfully started"
else
echo "tomcat not succesfully started"
fi



