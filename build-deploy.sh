cd /home/ilantian/myagent/_work/1/s/admin/
if [ -f "Fluid" ]
then
   rm -rf  Fluid 
else
    echo "Fluid is not found"
fi

if [ -f "args" ]
then
   rm args
else
    echo "args is not found"
fi
find src/ -name *.java > args 
mkdir Fluid 
cp -r WebContent/* Fluid/
mkdir Fluid/WEB-INF/classes  
cp -r src/*.properties Fluid/WEB-INF/classes
export classpath=/home/ilantian/myagent/_work/1/s/admin/WebContent/WEB-INF/lib/*:/opt/apache-tomcat-8.5.35/lib/*
javac @args -cp $classpath -g -d Fluid/WEB-INF/classes/
echo 'compiled'
cd Fluid
echo 'build war' 
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64
$JAVA_HOME/bin/jar -cvf ../Fluid.war .
cp ../Fluid.war /home/ilantian/apache-tomcat-8.5.35/webapps/
cd /home/ilantian/apache-tomcat-8.5.35/bin/
echo 'start tomcat'
sudo systemctl start tomcat.service
#bash -c /home/ilantian/apache-tomcat-8.5.35/bin/startup.sh > status.txt
echo 'end'
echo 'Running sonar analysis'
cd /home/ilantian/myagent/_work/1/s/admin
export PATH=$PATH:/home/ilantian/sonar-runner-2.4/bin
sonar-runner
echo 'sonar end'
https://dev.azure.com/ilanprojects/CompactIdentity-OnPrem/_apis/build/status/CompactIdentity-OnPrem-CI%20Devops?branchName=devops_automation

