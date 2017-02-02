## Trouble Report


### 1. What java version is installed?
--------------------------------------
```bash
[vagrant@mntlab ~]$ java -version
java version "1.7.0_79"
Java(TM) SE Runtime Environment (build 1.7.0_79-b15)
Java HotSpot(TM) 64-Bit Server VM (build 24.79-b02, mixed mode)
```
### 2. How was it installed and configured?
-------------------------------------------
```bash
[vagrant@mntlab ~]$ alternatives --config java

There are 2 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
*+ 1           /opt/oracle/java/x64//jdk1.7.0_79/bin/java
   2           /opt/oracle/java/i586//jdk1.7.0_79/bin/java
```
It was install manually (see alternatives), using alternatives --install /*path*/

### 3. Where are log files of tomcat and httpd?
-----------------------------------------------
```bash
[vagrant@mntlab log]$ sudo ls /var/log/httpd
access_log  error_log  jk-runtime-status.1298	    modjk.log
access.log  error.log  jk-runtime-status.1298.lock
```
```bash
[vagrant@mntlab conf]$ cd /opt/apache/tomcat/7.0.62/logs/
[vagrant@mntlab logs]$ ll
total 32
-rw-rw-r-- 1 tomcat tomcat 11673 Feb  2 17:07 catalina.2017-02-02.log
-rw-rw-r-- 1 tomcat tomcat 11673 Feb  2 17:07 catalina.out
-rw-rw-r-- 1 tomcat tomcat     0 Feb  2 16:04 host-manager.2017-02-02.log
-rw-rw-r-- 1 tomcat tomcat  1122 Feb  2 17:07 localhost.2017-02-02.log
-rw-rw-r-- 1 tomcat tomcat   707 Feb  2 18:10 localhost_access_log.2017-02-02.txt
-rw-rw-r-- 1 tomcat tomcat     0 Feb  2 16:04 manager.2017-02-02.log
```

### 4. Where is JAVA_HOME and what is it?
-----------------------------------------
The variable 'JAVA_HOME' is a configuration property that stores the location of the java files.


### 5. Where is tomcat installed?
---------------------------------
```bash
[vagrant@mntlab log]$ cd /opt/apache/tomcat/7.0.62/
[vagrant@mntlab 7.0.62]$ ll
total 116
drwxr-xr-x 2 tomcat tomcat  4096 Jul 12  2016 bin
drwxr-xr-x 3 tomcat tomcat  4096 Feb  2 16:04 conf
drwxr-xr-x 2 tomcat tomcat  4096 Jul 12  2016 lib
-rw-r--r-- 1 tomcat tomcat 56812 May  7  2015 LICENSE
drwxr-xr-x 2 tomcat tomcat  4096 Feb  2 16:04 logs
-rw-r--r-- 1 tomcat tomcat  1192 May  7  2015 NOTICE
-rw-r--r-- 1 tomcat tomcat  8965 May  7  2015 RELEASE-NOTES
-rw-r--r-- 1 tomcat tomcat 16204 May  7  2015 RUNNING.txt
drwxr-xr-x 2 tomcat tomcat  4096 Jul 12  2016 temp
drwxr-xr-x 7 tomcat tomcat  4096 May  7  2015 webapps
drwxr-xr-x 3 tomcat tomcat  4096 Feb  2 16:04 work
```

### 6. What is CATALINA_HOME?
-----------------------------
The variable 'CATALINA_HOME' is a configuration property that stores the location of the Catalina files.

### 7. What users run httpd and tomcat processes? How is it configured?
-----------------------------------------------------------------------
```bash
[vagrant@mntlab ~]$ ps -aef | grep httpd
root      1298     1  0 17:07 ?        00:00:00 /usr/sbin/httpd
apache    1300  1298  0 17:07 ?        00:00:01 /usr/sbin/httpd
apache    1301  1298  0 17:07 ?        00:00:00 /usr/sbin/httpd
apache    1303  1298  0 17:07 ?        00:00:00 /usr/sbin/httpd
apache    1304  1298  0 17:07 ?        00:00:00 /usr/sbin/httpd
apache    1306  1298  0 17:07 ?        00:00:00 /usr/sbin/httpd
apache    1308  1298  0 17:07 ?        00:00:00 /usr/sbin/httpd
apache    1312  1298  0 17:07 ?        00:00:00 /usr/sbin/httpd
apache    1314  1298  0 17:07 ?        00:00:01 /usr/sbin/httpd
vagrant   1541  1472  0 19:28 pts/0    00:00:00 grep httpd
vagrant   1548  1472  0 19:46 pts/0    00:00:00 grep httpd
[vagrant@mntlab ~]$ ps -aef | grep tomcat
tomcat    1365     1  0 17:07 ?        00:00:12 /usr/bin/java -Djava.util.logging.config.file=/opt/apache/tomcat/current/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.endorsed.dirs=/opt/apache/tomcat/current/endorsed -classpath /opt/apache/tomcat/current/bin/bootstrap.jar:/opt/apache/tomcat/current/bin/tomcat-juli.jar -Dcatalina.base=/opt/apache/tomcat/current -Dcatalina.home=/opt/apache/tomcat/current -Djava.io.tmpdir=/opt/apache/tomcat/current/temp org.apache.catalina.startup.Bootstrap start
vagrant   1550  1472  0 19:46 pts/0    00:00:00 grep tomcat

[vagrant@mntlab ~]$ cat /etc/httpd/conf/httpd.conf

***
User apache
Group apache
***

[vagrant@mntlab ~]$ cat /etc/init.d/tomcat 
***
 su - tomcat -c "sh /opt/apache/tomcat//current/bin/startup.sh" 

***
```

### 8. What configuration files are used to make components work with each other?
---------------------------------------------------------------------------------
Htttp.conf, vhost.conf, workers.properties, server.xml, tomcat-users.xml. 


### 9. What does it mean: “load average: 1.18, 0.95, 0.83”?
-----------------------------------------------------------
    over the last 1 minute: The computer was overloaded by 15% on average. On average, .15 processes were waiting for the CPU. (1.15)

    over the last 5 minutes: The CPU idled for 5% of the time. (0.95)

    over the last 15 minutes: The CPU idled for 17% of the time. (0.83)



## Trouble Report
|    | Issue                | How to find       | Time to find       | How to fix        | Time to fix     |
|---:|:--------------------:|:-----------------:|:------------------:|:-----------------:|:----------------| 
|   1| Vagrant up failure   | check Vagrantfile | 2 min              | vagrant box add mntlab20160711.box| 5 min |          
|   2| Response code 302    | curl -IL 192.168.56.10|    5 min       | cat /etc/httpd/conf/httpd.conf, sudo vi /etc/httpd/conf/httpd.conf,  Block virtual host section | 10 min| 
|   3|   Respone code 503 | vagrant ssh curl -IL localhost, netstat –natupl|     10 min          |  sudo service tomcat start \ grep tomcat   |  20 min | 
| 4  |Tomcat not running|cat /etc/init.d/tomcat ;sudo vi /etc/init.d/tomcat #comment > /dev/null ; cd /opt/apache/tomcat//current/bin/ ; sudo ./startup.sh ; cat ../logs/catalina.out | 1 hour| java -v ; sudo alternatives --config java ; alternatives --set java /opt/oracle/java/x64//jdk1.7.0_79/bin/java ; sudo ./startup.sh | 1 hour
| 5  |503 Response code, mod_jk doesn't work| cd /var/log/ ; sudo cat httpd/error_log ; sudo cat httpd/modjk.log ; sudo cat /etc/httpd/conf.d/vhost.conf ; sudo cat /etc/httpd/conf.d/workers.properties| 30 min | sudo vi /etc/httpd/conf.d/vhost.conf ; sudo vi /etc/httpd/conf.d/workers.properties #correct files| 1 hour
| 6  |Tomcat doesn't work after reboot| curl localhost ; netstat –natupl | 5 min | su ; su tomcat ; /opt/apache/tomcat/7.0.62/bin ; ./startup.sh | 1 hour|
| 7  |Cannot find /tmp/bin/setclasspath.sh| find / -name setclasspath.sh ; env ; cat ~/.bash_profile ; cat ~/.bashrc | 30 min | vi ~/.bashrc #delete incorrect lines ; ./startup.sh ; service tomcat start ; chown -R tomcat:tomcat /opt/apache/tomcat/7.0.62/logs/ ; service tomcat start ; curl -IL localhost ; chkconfig --list ; sudo chkconfig tomcat on ; sudo reboot ; curl -IL localhost | 3 hour|
| 8  | Don't have any rules in iptables| sudo iptables -L -n| 5 min| sudo iptables -A INPUT -p tcp -s 192.168.56.10 -m tcp --dport 22 -j ACCEPT ; sudo iptables -A INPUT -p tcp -s 192.168.56.10 -m tcp --dport 80 -j ACCEPT ; sudo service iptables save ; sudo chattr -i /etc/sysconfig/iptables ; sudo service iptables save ; sudo chattr +i /etc/sysconfig/iptables ; sudo service iptables restart | 2 hour|
  
