#!/bin/bash


##########################解压&&配置环境变量##########################
cd ~/
mkdir softwares
tar -zxvf jdk-7u79-linux-x64.tar.gz -C softwares
tar -zxvf hadoop-2.6.0-cdh5.7.0.tar.gz -C softwares
sed -i '12i export JAVA_HOME=/home/hadoop/softwares/jdk1.7.0_79' .bash_profile
sed -i '13i export PATH=$PATH:$JAVA_HOME/bin' .bash_profile
sed -i '14i export HADOOP_HOME=/home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0' .bash_profile
sed -i '15i export PATH=$PATH:$HADOOP_HOME/bin' .bash_profile
source /home/hadoop/.bash_profile 
##########################配置ssh免密钥##########################
echo "===========SSHKEYSET================="
ssh-keygen -t rsa
cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys

##########################hadoop配置##########################
mkdir /home/hadoop/softwares/old-set-hadoop
cp /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml.template /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
cp /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/* /home/hadoop/softwares/old-set-hadoop/

########################## hadoop-env.sh ##########################
sed -i '26i  export JAVA_HOME=/home/hadoop/softwares/jdk1.7.0_79' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hadoop-env.sh

########################## core-site.xml ##########################
sed -i '20i  <property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
sed -i '21i  <name>fs.defaultFS</name>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
sed -i '22i  <value>hdfs://localhost.localdomain:8020</value>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
sed -i '23i  </property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
sed -i '24i  <property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
sed -i '25i  <name>hadoop.tmp.dir</name>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
sed -i '26i  <value>/home/hadoop/softwares/tmp</value>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
sed -i '27i  </property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml

########################## hdfs-site.xml ##########################
sed -i '20i <property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml
sed -i '21i <name>dfs.replication</name>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml
sed -i '22i <value>1</value>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml
sed -i '23i </property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml

########################## mapred-site.xml ##########################
sed -i '20i <property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
sed -i '21i <name>mapreduce.framework.name</name>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
sed -i '22i <value>yarn</value>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
sed -i '23i </property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml

########################## yarn-site.xml ##########################
sed -i '18i <property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml
sed -i '19i <name>yarn.nodemanager.aux-services</name>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml
sed -i '20i <value>mapreduce_shuffle</value>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml
sed -i '21i </property>' /home/hadoop/softwares/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml

########################## 格式化hdfs文件系统 ##########################
hdfs namenode -format

########################## 启动dfs和yarn ##########################
~/./softwares/hadoop-2.6.0-cdh5.7.0/sbin/start-dfs.sh 
~/./softwares/hadoop-2.6.0-cdh5.7.0/sbin/start-yarn.sh 
jps
