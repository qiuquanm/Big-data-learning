#!/bin/bash



########################## 关闭dfs和yarn ##########################
stop-yarn.sh
stop-dfs.sh


##########################解压&&配置环境变量REMOVE##########################
cd ~
rm -rf modules
#sed -i '12i export JAVA_HOME=/home/hadoop/modules/jdk1.7.0_79' .bash_profile
#sed -i '13i export PATH=$PATH:$JAVA_HOME/bin' .bash_profile
#sed -i '14i export HADOOP_HOME=/home/hadoop/modules/hadoop-2.6.0-cdh5.7.0' .bash_profile
#sed -i '15i export PATH=$PATH:$HADOOP_HOME/bin' .bash_profile
#source /home/hadoop/.bash_profile

#########################DEL ssh免密钥##########################
rm -rf ~/.ssh/authorized_keys
rm -rf "$0"
#rm -rf *.sh
