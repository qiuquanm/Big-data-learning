#!/bin/bash
#Gostshop
 
PrintInfo(){
	echo "|=================================================================|"
	echo "|              version:0.1  作者：Gostshop                        |"
	echo "|                       脚本安装Hadoop                            |"
	echo "|        说明：jdk、hadoop压缩包与installhadoop.sh一个目录        |"
	echo "|=================================================================|"

}



##解压&&配置环境变量
Exp(){
	#echo "##解压&&配置环境变量"
	cd ~/
	mkdir modules
	wget -c ftp://172.16.9.74/jdk-7u79-linux-x64.tar.gz
	wget -c ftp://172.16.9.74/hadoop-2.6.0-cdh5.7.0.tar.gz
	tar -zxvf jdk-7u79-linux-x64.tar.gz -C modules
	#echo "jdk解压完成！"
	tar -zxvf hadoop-2.6.0-cdh5.7.0.tar.gz -C modules
	#echo "Hadoop解压完成！"
	sed -i '12i export JAVA_HOME=/home/hadoop/modules/jdk1.7.0_79' .bash_profile
	#sed -i '13i export PATH=$PATH:$JAVA_HOME/bin' .bash_profile
	sed -i '13i export HADOOP_HOME=/home/hadoop/modules/hadoop-2.6.0-cdh5.7.0' .bash_profile
	sed -i '14i export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' .bash_profile
	sed -i '15i alias hfs="hadoop fs"' .bash_profile
	source /home/hadoop/.bash_profile 
}


##配置ssh免密钥
SshKey(){
	#echo "##配置ssh免密钥"
	ssh-keygen -t rsa
	cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
}

##hadoop配置
HadoopSet(){
	#echo "## hadoop-env.sh"
	mkdir /home/hadoop/modules/old-set-hadoop
	cp /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml.template /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
	cp /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/* /home/hadoop/modules/old-set-hadoop/

####### hadoop-env.sh #######
	sed -i '26i  export JAVA_HOME=/home/hadoop/modules/jdk1.7.0_79' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hadoop-env.sh
}

## core-site.xml
HadoopCore(){
	#echo "## core-site.xml"
	sed -i '20i  <property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
	sed -i '21i  <name>fs.defaultFS</name>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
	sed -i '22i  <value>hdfs://localhost.localdomain:8020</value>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
	sed -i '23i  </property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
	sed -i '24i  <property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
	sed -i '25i  <name>hadoop.tmp.dir</name>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
	sed -i '26i  <value>/home/hadoop/modules/tmp</value>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
	sed -i '27i  </property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/core-site.xml
}

## hdfs-site.xml
HadoopHdfs(){
	#echo "## hdfs-site.xml"
	sed -i '20i <property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml
	sed -i '21i <name>dfs.replication</name>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml
	sed -i '22i <value>1</value>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml
	sed -i '23i </property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/hdfs-site.xml
}

## mapred-site.xml
HadoopMapred(){
	#echo "## mapred-site.xml"
	sed -i '20i <property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
	sed -i '21i <name>mapreduce.framework.name</name>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
	sed -i '22i <value>yarn</value>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
	sed -i '23i </property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/mapred-site.xml
}

## yarn-site.xml
HadoopYarn(){
	#echo "## yarn-site.xml"
	sed -i '18i <property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml
	sed -i '19i <name>yarn.nodemanager.aux-services</name>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml
	sed -i '20i <value>mapreduce_shuffle</value>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml
	sed -i '21i </property>' /home/hadoop/modules/hadoop-2.6.0-cdh5.7.0/etc/hadoop/yarn-site.xml
}

## 格式化hdfs文件系统
HdfsForMat(){
	#echo "## 格式化hdfs文件系统"
	hdfs namenode -format
}

## 启动dfs和yarn
StartServer(){
	#echo "## 启动dfs和yarn"
	start-dfs.sh 
	start-yarn.sh
}

#echo "HADOOPINSTALL"
PrintInfo

##配置ssh免密钥
SshKey

##解压&&配置环境变量
Exp

##hadoop配置
HadoopSet

## core-site.xml
HadoopCore

## hdfs-site.xml
HadoopHdfs

## mapred-site.xml
HadoopMapred

## yarn-site.xml
HadoopYarn

## 格式化hdfs文件系统
HdfsForMat

## 启动dfs和yarn
StartServer

jps
source /home/hadoop/.bash_profile 
rm -rf "$0"
#rm -rf /home/hadoop/*.sh
