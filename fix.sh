#fixing httpd 
#changing error configs 

   /bin/cp /vagrant/httpd.conf /etc/httpd/conf/
   /bin/cp /vagrant/vhost.conf /etc/httpd/conf.d/
   /bin/cp /vagrant/workers.properties /etc/httpd/conf.d/

service httpd restart


#fixing java alternative

alternatives --set java /opt/oracle/java/x64//jdk1.7.0_79/bin/java 

#fixing .bashrc 

sed -ie '/export/d' /home/tomcat/.bashrc

#fixing owner of tomcat logs 

chown -R tomcat:tomcat /opt/apache/tomcat/7.0.62/logs/

#fixing tomcat auto-start

service tomcat start

chkconfig tomcat on


#fixing JAVA_HOME, CATALINA_HOME

export JAVA_HOME=/opt/oracle/java/x64/jdk1.7.0_79/jre
export CATALINA_HOME=/opt/apache/tomcat/7.0.62


#fixing iptables ports

iptables -A INPUT -p tcp -s 192.168.56.10 -m tcp --dport 22 -j ACCEPT

iptables -A INPUT -p tcp -s 192.168.56.10 -m tcp --dport 80 -j ACCEPT

chattr -i /etc/sysconfig/iptables
service iptables save
chattr +i /etc/sysconfig/iptables
service iptables restart

#creating symlink for logs of tomcat
ln -s /opt/apache/tomcat/7.0.62/logs /var/log/tomcat

