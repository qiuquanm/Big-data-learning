## HADOOP伪分布式搭建

### 1. ssh免密码登录

```sh
ssh-keygen -t rsa
cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
```

#### 1.1 验证ssh免密钥是否成功

```sh
ssh localhost
```



### 2. 配置环境变量

```shell
vim ~/.bash_profile	#用户级别的环境变量
vim ~/.bashrc		#用户级别的环境变量每个终端打开都会读取.bashrc这个文件
vim /etc/profile	#系统环境变量
```

```sh
#JAVA PATH
export JAVA_HOME=	#你jdk的解压路径
export PATH=$PATH:$JAVA_HOME/bin

#hadoop PATH
export HADOOP_HOME=	#你hadoop的解压路径
export PATH=$PATH:$HADOOP_HOME/bin

#别名
alias hfs="hadoop fs"
```

#### 2.1 重新加载配置文件

```shell
source ~/.bash_profile
```



### 3. 配置HADOOP

#### 3.1 配置文件都在`hadoop-2.6.0-cdh5.7.0`文件里面的

开始是不会有`mapred-site.xml`这个文件的

```sh
cp mapred-site.xml.template mapred-site.xml
```

```html
httpfs-env.sh
mapred-site.xml
core-site.xml  
mapred-site.xml.template
hadoop-env.sh
hdfs-site.xml
yarn-site.xml
```

然后就是配置这些文件了：

`hadoop-env.sh`

```shell
# The java implementation to use.
#export JAVA_HOME=${JAVA_HOME}
export JAVA_HOME=	#你jdk解压的路径
```

`core-site.xml`

```xml
#localhost.localdomain 自己的主机名
<configuration>
<property>
<name>fs.defaultFS</name>
<value>hdfs://localhost.localdomain:8020</value>
</property>
<property>
<name>hadoop.tmp.dir</name>
<value>/home/hadoop/softwares/tmp</value>
</property>
</configuration>
```

`hdfs-site.xml`

```xml
<configuration>
<property>
<name>dfs.replication</name>
<value>1</value>
</property>
</configuration>
```

`mapred-site.xml`

```xml
<configuration>
<property>
<name>mapreduce.framework.name</name>
<value>yarn</value>
</property>
</configuration>
```

 `yarn-site.xml` 

```xml
<configuration>
<property>
<name>yarn.nodemanager.aux-services</name>
<value>mapreduce_shuffle</value>
</property>
</configuration>
```

### 3.2 格式化hdfs文件系统

```sh
hdfs namenode -format
hadoop fs namenode -format       # 首次运行需要执行初始化，之后不需要
```

#### 3.3 启动

```sh
[hadoop@localhost sbin]$./start-dfs.sh 
[hadoop@localhost sbin]$./start-yarn.sh 
```

#### 3.4 检查运行进程

```sh
[hadoop@localhost sbin]$ jps
3596 NodeManager
3164 DataNode
3506 ResourceManager
3074 NameNode
3350 SecondaryNameNode
3807 Jps
```



### 4. 运行一些Hadoop的小程序

#### 4.1 统计词汇

```sh
mkdir input		#注意自己所在的路径
cp hadoop-2.6.0-cdh5.7.0/etc/hadoop/* input/
```

```sh
hadoop jar hadoop-mapreduce-examples-2.6.0-cdh5.7.0.jar grep ~/input/ ~/output '[a-z]+'
```

#### 4.2 计算PI

```sh
hadoop jar hadoop-mapreduce-examples-2.6.0-cdh5.7.0.jar pi 10 200
```

> 其中：
> 第一个10是运行10次map任务，第二个200是每个map任务投掷次数，所以总投掷次数是10×200=2000。



#### 4.3在hdfs文件系统内运行wordcount统计词

```sh
mkdir input
cp hadoop-2.6.0-cdh5.7.0/etc/hadoop/* input/
hadoop fs -put input/ /	#把当前文件下的input文件上传到hdfs文件系统的/目录
```

```shell
hadoop jar hadoop-mapreduce-examples-2.6.0-cdh5.7.0.jar wordcount /input/*.xml /output
```

















**配置内容还不够完善，有错误欢迎指出!**

-----------------------------------

