## Linux基础



[TOC]



## Linux命令

```sh
#
ls	#显示当前目录下有什么文件
cd	#进入目录
cp #复制
mv #剪切和重命名
pwd	#显示当前路径

#查看文件内容命令
more  
less 
head
cat

#用户管理命令
useradd 用户名	#添加用户
passwd	用户  #设置密码、不写用户默认给当前用户设置密码
userdel 用户名	#删除用户
userdel -r 用户名	#删除用户以及用户主目录

mkdir	#创建目录
touch	#创建文件

```

Bash快捷键



```bash
Ctrl-A 相当于HOME键，用于将光标定位到本行最前面
Ctrl-E 相当于End键，即将光标移动到本行末尾
Ctrl-U 用于删除从光标开始到行首的所有字符。一般在密码或命令输入错误时常用
Ctrl-K 用于删除从光标处开始到结尾处的所有字符
Ctrl-R 进入历史命令查找状态，然后你输入几个关键字符，就可以找到你使用过的命令
Ctrl-L 清屏，相当于clear命令
Alt-. 用于提取历史命令中的最后一个单词。你先执行history命令，然后再敲击此快捷键若干下，你就懂了！

Ctrl-D 相当于Del键，即删除光标所在处的字符
Ctrl-P 相当于上箭头键，即显示上一个命令 
Ctrl-J 相当于回车键

```





Linux启动级别

命令：`init [0123456]`

```sh
运行级别
0:关机
1：单用户
2：多用户状态没有网络服务
3：多用户状态有网络服务
4：系统未使用保留给用户
5：图形界面
6：系统重启
```

**常用**的**运行级别**是**3**和**5** 

要修改默认的运行级别可改文件`/etc/inittab`里面的`id:5:initdefault:`这一行的数字





## VIM命令模式与输入模式切换

### vim编辑器

```sh
命令模式
u：撤销
x：删除光标所在字符
v：选择文本
p:粘贴
y：复制
yy：复制当前行
dd：删除光标所在一行
xxG：跳转到xx行
gg: 文件第一行
G:文件最后一行
^:行首
$:行尾
```

 vi编辑器

vi是UNIX和类UNIX环境下的可用于创建文件的屏幕编辑器。vi有两种工作模式：命令模式和文本输入模式。启动vi需要输入vi，按[Spacebar]键并输入文件名后回车。

### 切换模式键

vi从命令模式切换到文本输入模式。每个键以不同方式使vi进入文本输入模式。按**[ESC]**键使vi从文本输入模式回到命令模式。

表1列出了vi从命令模式切换到文本输入模式的命令键及其功能。

表1 切换到文本输入模式的命令键

| **键** | **功能**                                         |
| ------ | ------------------------------------------------ |
| i      | 在光标左侧输入正文                               |
| I      | 在光标所在行的行首输入正文                       |
| a      | 在光标右侧输入正文                               |
| A      | 在光标所在行的行尾输入正文                       |
| o      | 在光标所在行的下一行增添新行，光标位于新行的行首 |
| O      | 在光标所在行的上一行增添新行，光标位于新行的行首 |

 

说明：*1. 光标的位置由双下划线（═）标明。*

*2. 当前行指光标所在的那一行。*

### 退出命令

只有一种方式进入vi，但是有几种方式退出vi，退出方式的选择取决于如何处理编辑后的文件。

除了ZZ命令外，这些命令都以:开始，用[Return]结束命令行。表2列出了vi编辑器的退出命令及其功能。

表2 vi编辑器的退出命令

| **键** | **功能**                   |
| ------ | -------------------------- |
| :wq    | 保存文件，退出vi编辑器     |
| :w     | 保存文件，但不退出vi编辑器 |
| :q     | 退出vi编辑器               |
| :q!    | 不保存文件，退出vi编辑器   |
| ZZ     | 保存文件，退出vi编辑器     |

 

### 文本修改键

这些键只适用于命令模式。表3列出了vi编辑器的退出命令及其功能。

表3 命令模式下vi编辑器的文本修改键

| **键**  | **功能**                                           |
| ------- | -------------------------------------------------- |
| x       | 删除光标位置指定的字符                             |
| dd      | 删除光标所在的行                                   |
| u       | 撤销最近的修改                                     |
| U       | 撤销对当前行上做的所有修改                         |
| r       | 替换光标位置上的一个字符                           |
| R       | 替换从光标位置开始的字符，同时改变vi到文本输入模式 |
| .（点） | 重复上一次的修改                                   |

 

### 光标移动指令

在命令模式下，这些键可以在文档中移动光标。表4列出了vi编辑器的退出命令及其功能。

表4 vi的光标移动键

| **键**        | **功能**               |
| ------------- | ---------------------- |
| h或[   ]      | 将光标向左移动一格     |
| j或[   ]      | 将光标向下移动一格     |
| k或[   ]      | 将光标向上移动一格     |
| l或[   ]      | 将光标向右移动一格     |
| $             | 将光标移到当前行的行尾 |
| w             | 将光标向右移一个字     |
| b             | 将光标向左移一个字     |
| e             | 将光标移到字尾         |
| 0（零）       | 将光标移到当前行的行首 |
| [Return]键    | 将光标移到下一行的行首 |
| [Spacebar]键  | 将光标向右移动一位     |
| [Backspace]键 | 将光标向左移动一位     |

 

**注意**：在文本输入模式下避免使用光标键（箭头键）。因为在某些系统中，光标键被解释为普通的ASCII 字符。如果在文本输入模式下使用光标键，那么对应的ASCII字符将被插入文件中。

### 剪切和粘贴键

这些键用来重新安排用户文件中的文本，在vi的命令模式下可用。表5列出了vi编辑器的剪切和粘贴键及其功能。

表5 vi编辑器的剪切和粘贴键

| **键** | **功能**                                                     |
| ------ | ------------------------------------------------------------ |
| d      | 删除指定位置的文本，并存到临时的缓冲区中。可以使用put操作符（p或P键）访问这个缓冲区 |
| y      | 将指定位置的文本复制到临时缓冲区。可以使用put操作符访问这个缓冲区 |
| P      | 将指定缓冲区的内容放到当前光标的位置之上                     |
| p      | 将指定缓冲区的内容放到当前光标的位置之下                     |

### 翻页键

翻页键用来大块滚动用户的文件，在vi的命令模式下可用。表6列出了vi编辑器的翻页键及其功能。

表 6  vi编辑器的翻页键

| **键**   | **功能**                               |
| -------- | -------------------------------------- |
| [Ctrl-d] | 将光标向下移到文件尾，通常每次移动12行 |
| [Ctrl-u] | 将光标向上移到文件头，通常每次移动12行 |
| [Ctrl-f] | 将光标向下移到文件尾，通常每次移动24行 |
| [Ctrl-b] | 将光标向上移到文件头，通常每次移动24行 |

 

三种常见的模式：Normail Mode(命令模式），Insert Mode(输入模式)和Visual Mode（视图模式）。
命令模式和输入模式的切换有Append，Insert，Replace，Subsitute 记作**AIRS**，这种记忆方法特别方便，英文单词的意思是空气，vim在命令模式和输入模式的切换就像空气一样，无影无形。
![img](https://images.cnblogs.com/cnblogs_com/zengyongjoy/Screenshot.png)
编辑文本无非就是基本的字符输入和切换光标的位置，平时光标切换就是通过键盘上的上下左右的键盘来实现的，这个上下左右的键盘切换光标虽然也是很方便，但是是不是要从我们键盘手势上移动，而vim可以完全不用移动，通过hjkl。
h：左移一个位置
j:往下一行
k:往上一行
l:右移一个位置

非学，无以致疑；非问，无以广识



## 修改文件权限命令

**chmod、chgrp、chown详解**



Linux系统中的每个文件和目录都有访问许可权限，用它来确定谁可以通过何种方式对文件和目录进行访问和操作。

文件或目录的访问权 限分为只读，只写和可执行三种。以文件为例，只读权限表示只允许读其内容，而禁止对其做任何的更改操作。可执行权限表示允许将该文件作为一个程序执行。文 件被创建时，文件所有者自动拥有对该文件的读、写和可执行权限，以便于对文件的阅读和修改。用户也可根据需要把访问权限设置为需要的任何组合。

![Linux命令:修改文件权限命令chmod、chgrp、chown详解](http://images.yusi123.com/wp-content/uploads/2014/06/Linux-command-chmod.gif)

有三种不同类型的用户可对文件或目录进行访问：文件所有者，同组用户、其他用户。所有者一般是文件的创建者。所有者可以允许同组用户有权访问文件，还可以将文件的访问权限赋予系统中的其他用户。在这种情况下，系统中每一位用户都能访问该用户拥有的文件或目录。

每一文件或目录的访问权限都有三组，每组用三位表示，分别为文件属主的读、写和执行权限；与属主同组的用户的读、写和执行权限；系统中其他用户的读、写和执行权限。当用`ls -l`命令显示文件或目录的详细信息时，最左边的一列为文件的访问权限。例如：

1. $ ls -l sobsrc. tgz
2. -rw-r--r-- 1 root root 483997 Ju1 l5 17:3l sobsrc. tgz

横线代表空许可。r代表只读，w代表写，x代表可执行。注意这里共有10个位置。第一个字符指定了文件类型。在通常意义上，一个目录也是一个文件。如果第一个字符是横线，表示是一个非目录的文件。如果是d，表示是一个目录。例如：

> – rw- r– r–
>
> 普通文件 文件主 组用户 其他用户

是文件sobsrc.tgz 的访问权限，表示sobsrc.tgz是一个普通文件；sobsrc.tgz的属主有读写权限；与sobsrc.tgz属主同组的用户只有读权限；其他用户也只有读权限。

确定了一个文件的访问权限后，用户可以利用Linux系统提供的[chmod](http://yusi123.com/tag/chmod)命令来重新设定不同的访问权限。也可以利用[chown](http://yusi123.com/tag/chown)命令来更改某个文件或目录的所有者。利用[chgrp](http://yusi123.com/tag/chgrp)命令来更改某个文件或目录的用户组。

下面分别对这些命令加以介绍。

### chmod 命令

chmod命令是非常重要的，用于改变文件或目录的访问权限。用户用它控制文件或目录的访问权限。

以主文件夹下的一个名为“cc”的文件夹为例。下面一步一步介绍如何修改权限：

1.打开终端。输入”su”(没有引号)

2.接下来会要你输入密码，输入你的root密码。

3.假设我的文件夹在主目录里，地址为  /var/home/dengchao/cc  。假设我要修改文件权限为777，则在终端输入  chmod  777 /var/home/userid/cc 文件夹的权限就变为了777。

如果是修改文件夹及子文件夹权限可以用  chmod -R 777 /var/home/userid/cc

具体的权限(例如777的含意等)在下面解释下：

1.777有3位，最高位7是设置文件所有者访问权限，第二位是设置群组访问权限，最低位是设置其他人访问权限。

其中每一位的权限用数字来表示。具体有这些权限：

- r(Read，读取，权限值为4)：对文件而言，具有读取文件内容的权限；对目录来说，具有浏览目 录的权限。
- w(Write,写入，权限值为2)：对文件而言，具有新增、修改文件内容的权限；对目录来说，具有删除、移动目录内文件的权限。
- x(eXecute，执行，权限值为1)：对文件而言，具有执行文件的权限；对目录了来说该用户具有进入目录的权限。

\2. 首先我们来看如何确定单独一位上的权限数值，例如最高位表示文件所有者权限数值，当数字为7时，7用“rwx”表示 –{4(r)+2(w)+1(x)=7}–又如果数值为6，则用“rw-”表示–{4(r)+2(w)+0(x)=6}–，”-”表示不具备权限，这里表 示不具备“执行”权限。

假如我们设定其他用户的访问权限为 “r–”，则数值为4+0+0=4

一开始许多初学者会被搞糊涂，其实很简单，我们将rwx看成二进制数，如果有则用1表示，没有则有0表示，那么rwx则可以表示成为：111

而二进制的111就是7。

3.我们再来看下怎么确定3个数位上的权限。假如我们要给一个文件设置权限，具体权限如下：

文件所有者有“读”、“写”、“执行”权限，群组用户有“读”权限，其他用户有“读”权限，则对应的字母表示为”rwx r– r–“，对应的数字为744

一般都是最高位表示文件所有者权限值，第二位表示群组用户权限，最低位表示其他用户权限。

下面来举些例子熟悉下。

| 权限       | 数值 |
| ---------- | ---- |
| rwx rw- r– | 764  |
| rw- r– r–  | 644  |
| rw- rw- r– | 664  |

该命令有两种用法。一种是包含字母和操作符表达式的文字设定法；另一种是包含数字的数字设定法。

### 1. 文字设定法

> chmod ［who］ ［+ | – | =］ ［mode］ 文件名¼

命令中各选项的含义为：

操作对象who可是下述字母中的任一个或者它们的组合：

- u 表示“用户（user）”，即文件或目录的所有者。
- g 表示“同组（group）用户”，即与文件属主有相同组ID的所有用户。
- o 表示“其他（others）用户”。
- a 表示“所有（all）用户”。它是系统默认值。

操作符号可以是：

- \+ 添加某个权限。
- – 取消某个权限。
- = 赋予给定权限并取消其他所有权限（如果有的话）。
- 设置mode所表示的权限可用下述字母的任意组合：
- r 可读。
- w 可写。
- x 可执行。
- X 只有目标文件对某些用户是可执行的或该目标文件是目录时才追加x 属性。
- s 在文件执行时把进程的属主或组ID置为该文件的文件属主。方式“u＋s”设置文件的用户ID位，“g＋s”设置组ID位。
- t 保存程序的文本到交换设备上。
- u 与文件属主拥有一样的权限。
- g 与和文件属主同组的用户拥有一样的权限。
- o 与其他用户拥有一样的权限。
- -c : 若该档案权限确实已经更改，才显示其更改动作
- -f : 若该档案权限无法被更改也不要显示错误讯息
- -v : 显示权限变更的详细资料
- -R : 对目前目录下的所有档案与子目录进行相同的权限变更(即以递回的方式逐个变更)
- –help : 显示辅助说明
- –version : 显示版本

文件名：以空格分开的要改变权限的文件列表，支持通配符。在一个命令行中可给出多个权限方式，其间用逗号隔开。例如：chmod g+r，o+r example使同组和其他用户对文件example 有读权限。

**例1：**

1. $ chmod a+x sort

即设定文件sort的属性为：

文件属主（u） 增加执行权限

与文件属主同组用户（g） 增加执行权限

其他用户（o） 增加执行权限

**例2：**

1. $ chmod ug+w，o-x text

即设定文件text的属性为：

文件属主（u） 增加写权限

与文件属主同组用户（g） 增加写权限

其他用户（o） 删除执行权限

**例3：**

1. $ chmod u+s a.out

假设执行chmod后a.out的权限为（可以用ls – l a.out命令来看）：

1. –rws--x--x 1 inin users 7192 Nov 4 14:22 a.out

并且这个执行文件要用到一个文本文件shiyan1.c，其文件存取权限为“–rw——-”，即该文件只有其属主具有读写权限。

当其他用户执行a.out这个程序时，他的身份因这个程序暂时变成inin（由于chmod命令中使用了s选项），所以他就能够读取shiyan1.c这个文件（虽然这个文件被设定为其他人不具备任何权限），这就是s的功能。

因此，在整个系统中特别是root本身，最好不要过多的设置这种类型的文件（除非必要）这样可以保障系统的安全，避免因为某些程序的bug而使系统遭到入侵。

**例4：**

1. $ chmod a–x mm.txt
2. $ chmod –x mm.txt
3. $ chmod ugo–x mm.txt

以上这三个命令都是将文件mm.txt的执行权限删除，它设定的对象为所有使用者。

### 2. 数字设定法

我们必须首先了解用数字表示的属性的含义：0表示没有权限，1表示可执行权限，2表示可写权限，4表示可读权限，然后将其相加。所以数字属性的格式应为3个从0到7的八进制数，其顺序是（u）（g）（o）。

例如，如果想让某个文件的属主有“读/写”二种权限，需要把4（可读）+2（可写）＝6（读/写）。

数字设定法的一般形式为：chmod ［mode］ 文件名¼

**例1：**

1. $ chmod 644 mm.txt
2. $ ls –l

即设定文件mm.txt的属性为：

1. -rw-r--r-- 1 inin users 1155 Nov 5 11:22 mm.txt

文件属主（u）inin 拥有读、写权限

与文件属主同组人用户（g） 拥有读权限

其他人（o） 拥有读权限

**例2：**

1. $ chmod 750 wch.txt
2. $ ls –l
3. -rwxr-x--- 1 inin users 44137 Nov 12 9:22 wchtxt

即设定wchtxt这个文件的属性为：

文件主本人（u）inin 可读/可写/可执行权

与文件主同组人（g） 可读/可执行权

其他人（o） 没有任何权限

### [chgrp](http://yusi123.com/tag/chgrp)命令

功能：改变文件或目录所属的组。

语法：[chgrp](http://yusi123.com/tag/chgrp) ［选项］ group filename¼

参数：

- -c或–changes 效果类似”-v”参数，但仅回报更改的部分。
- -f或–quiet或–silent 　不显示错误信息。
- -h或–no-dereference 　只对符号连接的文件作修改，而不更动其他任何相关文件。
- -R或–recursive 　递归处理，将指定目录下的所有文件及子目录一并处理。
- -v或–verbose 　显示指令执行过程。
- –help 　在线帮助。
- –reference=&lt;参考文件或目录&gt; 　把指定文件或目录的所属群组全部设成和参考文件或目录的所属群组相同。
- –version 　显示版本信息。

该命令改变指定指定文件所属的用户组。其中group可以是用户组ID，也可以是/etc/group文件中用户组的组名。文件名是以空格分开的要改变属组的文件列表，支持通配符。如果用户不是该文件的属主或超级用户，则不能改变该文件的组。

该命令的各选项含义为：

– R 递归式地改变指定目录及其下的所有子目录和文件的属组。

**例1：**

1. $ [chgrp](http://yusi123.com/tag/chgrp) - R book /opt/local /book

改变/opt/local /book/及其子目录下的所有文件的属组为book。

### [chown](http://yusi123.com/tag/chown) 命令

功能：更改某个文件或目录的属主和属组。这个命令也很常用。例如root用户把自己的一个文件拷贝给用户yusi，为了让用户yusi能够存取这个文件，root用户应该把这个文件的属主设为yusi，否则，用户yusi无法存取这个文件。

语法：[chown](http://yusi123.com/tag/chown) ［选项］ 用户或组 文件

说明：[chown](http://yusi123.com/tag/chown)将指定文件的拥有者改为指定的用户或组。用户可以是用户名或用户ID。组可以是组名或组ID。文件是以空格分开的要改变权限的文件列表，支持通配符。

**参数说明：**

- user : 新的档案拥有者的使用者 ID
- group : 新的档案拥有者的使用者群体(group)
- -c : 若该档案拥有者确实已经更改，才显示其更改动作
- -f : 若该档案拥有者无法被更改也不要显示错误讯息
- -h : 只对于连结(link)进行变更，而非该 link 真正指向的档案
- -v : 显示拥有者变更的详细资料
- -R : 对目前目录下的所有档案与子目录进行相同的拥有者变更(即以递回的方式逐个变更)
- –help : 显示辅助说明
- –version : 显示版本

例1：把文件yusi123.com的所有者改为yusi。

1. $ [chown](http://yusi123.com/tag/chown) yusi yusi123.com

例2：把目录/demo及其下的所有文件和子目录的属主改成yusi，属组改成users。

1. $ chown - R yusi.users /demo

例如：chown qq /home/qq  (把home目录下的qq目录的拥有者改为qq用户)

例如：chown -R qq /home/qq  (把home目录下的qq目录下的所有子文件的拥有者改为qq用户)



## 解压与压缩

```sh
tar –cvf file.tar file 	//压缩tar
tar -xvf file.tar		 //解压 tar包

tar -czf tar.gz file	 //压缩tar.gz 
tar -xzvf file.tar.gz 	//解压tar.gz

tar -cjf file.tar.bz2 file //压缩tar.gz
tar -xjvf file.tar.bz2   //解压 tar.bz2


tar -Jcf file.tar.xz file	//创建压缩
tar -Jxf file.tar.xz		 //解压tar.xz

tar -zxvf xxx.tar.gz -C /xx/x解压到那个目录x/

tar -xvf file.tar		//解压tar包
tar -zxvf file.tar.gz	//解压tar.gzs包
tar -xjvf file.tar.gz2	//解压tar.gz2包
tar -xZvf file.tar.Z	//解压tar.z包
unrar e file.rar		//解压rar包
unzip file.zip			//解压zip包
```





## SentOS防火墙配置

Centos升级到7之后，内置的防火墙已经从iptables变成了firewalld。所以，端口的开启还是要从两种情况来说明的，即iptables和firewalld。更多关于CentOs防火墙的最新内容，请参考Redhat官网。

### 一、iptables

#### 1.打开/关闭/重启防火墙

```sh
#开启防火墙(重启后永久生效)：
chkconfig iptables on

#关闭防火墙(重启后永久生效)：
chkconfig iptables off

#开启防火墙(即时生效，重启后失效)：
service iptables start

#关闭防火墙(即时生效，重启后失效)：
service iptables stop

#重启防火墙:
service iptables restartd

#3.查询TCP连接情况：
 netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
 
#4.查询端口占用情况：
 netstat   -anp   |   grep  portno  #（例如：netstat –apn | grep 80）
```

#### 2.查看打开的端口

```sh
/etc/init.d/iptables status
```

#### 3.打开某个端口(以8080为例)

（1）开启端口

```sh
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT 
```

（2）保存并重启防火墙

```sh
/etc/rc.d/init.d/iptables save
/etc/init.d/iptables restart
```

#### 4.打开49152~65534之间的端口

```sh
iptables -A INPUT -p tcp --dport 49152:65534 -j ACCEPT  
```

同样，这里需要对设置进行保存，并重启防火墙。

#### 5.其他打开方式

我们还可以通过修改`/etc/sysconfig/iptables`文件的方式开启端口，如下

```sh
vi /etc/sysconfig/iptables
```

然后在文件中增加一行

```sh
-A RH-Firewall-1-INPUT -m state –state NEW -m tcp -p tcp –dport 8080 -j ACCEPT
```

> 参数说明:
> –A 参数就看成是添加一条规则
> –p 指定是什么协议，我们常用的tcp 协议，当然也有udp，例如53端口的DNS
> –dport 就是目标端口，当数据从外部进入服务器为目标端口
> –sport 数据从服务器出去，则为数据源端口使用
> –j 就是指定是 ACCEPT -接收 或者 DROP 不接收

### 二、firewalld

Centos7默认安装了firewalld，如果没有安装的话，可以使用 yum install firewalld firewalld-config进行安装。

#### 1.启动防火墙

```sh
systemctl start firewalld 
```

#### 2.禁用防火墙

```sh
systemctl stop firewalld
```

#### 3.设置开机启动

```sh
systemctl enable firewalld
```

#### 4.停止并禁用开机启动

```sh
sytemctl disable firewalld
```

#### 5.重启防火墙

```sh
firewall-cmd --reload
```

#### 6.查看状态

```sh
systemctl status firewalld
#或者 
firewall-cmd --state
```

#### 7.查看版本

```sh
firewall-cmd --version
```

#### 8.查看帮助

```sh
firewall-cmd --help
```

#### 9.查看区域信息

```sh
firewall-cmd --get-active-zones
```

#### 10.查看指定接口所属区域信息

```sh
firewall-cmd --get-zone-of-interface=eth0
```

#### 11.拒绝所有包

```sh
firewall-cmd --panic-on
```

#### 12.取消拒绝状态

```sh
firewall-cmd --panic-off
```

#### 13.查看是否拒绝

```sh
firewall-cmd --query-panic
```

#### 14.将接口添加到区域(默认接口都在public)

```sh
firewall-cmd --zone=public --add-interface=eth0
#(永久生效再加上 --permanent 然后reload防火墙)
```

#### 15.设置默认接口区域

```sh
firewall-cmd --set-default-zone=public(立即生效，无需重启)
```

#### 16.更新防火墙规则

```sh
firewall-cmd --reload或firewall-cmd --complete-reload(两者的区别就是第一个无需断开连接，就是firewalld特性之一动态
添加规则，第二个需要断开连接，类似重启服务)
```

#### 17.查看指定区域所有打开的端口

```sh
firewall-cmd --zone=public --list-ports
```

#### 18.在指定区域打开端口（记得重启防火墙）

```sh
firewall-cmd --zone=public --add-port=80/tcp(永久生效再加上 --permanent)
```

> 说明：
> –zone 作用域
> –add-port=8080/tcp 添加端口，格式为：端口/通讯协议
> –permanent #永久生效，没有此参数重启后失效





## Linux软件安装

解决依赖

www,rpmseek.com

www.rpmfind.net



### 源配置





### 本地源配置

iso镜像文件挂载

```
mkdir /mnt/cdrom
mount -t iso9660 -o loop xxxxxxxxxx.iso /mnt/cdrom/
```

1：挂载光盘镜像

```sh
[root@centos ~]# mkdir /mnt/cdrom 
[root@centos ~]# mount /dev/cdrom  /mnt/cdrom/ 
mount: block device /dev/sr0 is write-protected, mounting read-only
```
2: 备份一下配置文件

```sh
cp /etc/yum.repos.d/Cenos-Media.repo /etc/yum.repos.d/Cenos-Media.repo.bak
```

将几个`Cenos-Debuginfo.repo` 、`Cent-Base.repo`、`Centos-Vault.repo`几个**配置文件也备份一遍**

拷贝`Cenos-Media.repo`。**不然yum会提示这几个文件的源找不到**

5：编辑`/etc/yum.repos.d/Cenos-Media.repo`

```sh
[root@centos ~]# vim /etc/yum.repos.d/CentOS-Media.repo 
#修改
[c6-media] 
name=CentOS-$releasever - Media    #--仓库名 
baseurl=file:///mnt/cdrom       # --软件包路径 
gpgcheck=1       # --启用包检查 
enabled=1         #--启用这个仓库 
gpgkey=file:///mnt/cdrom/RPM-GPG-KEY-CentOS-6 #此处改为挂载的光盘路径 否则 安装软件出错
```

 4.常用yum基本命令

> ​            yum --help                --帮助信息
> ​            yum list                   --列出软件包
> ​            yum repolist        --查看有多少仓库
> ​            yum info 软件包        --软件包的信息
> ​            yum install  软件包        --安装软件包
> ​            yum reinstall 软件包        --覆盖安装软件包
> ​            yum remove 软件包      --删除软件包
> ​            yum clean 软件包    --清除软件包
> ​            yum grouplist          --查看软件组
> ​            yum groupinstall "软件组"    --安装软件组
> ​            yum install info "软件组"    --查看软件组的信息
> ​            yum remove “组件组"    --删除软件组
> ​            yum  search  软件包    --检测是否有软件包      
> ​            yum  update  软件包      --软件包升级





## 磁盘管理

fdesk -l





## 举栗子

权限修改
r---->4	w---->2	x---->1

u---->user	g---->group	o---->其他用户

```sh
chmod u+rex file
```



链接

软链接

```sh
ln -s oldfile newfile
ln -s A C    // A->C
```

硬链接

```sh
link oldfile newfile
ln oldfile newfile
```

```sh
rpm -ivh telnet
rpm -e #卸载
rpm -q #查询

```


文件检验
```sh

find ./ -type f | xargs md5sum >> md5_rc1.txt
find ./ -type f  -print| xargs md5sum >> md5_rc1.txt
find ./ -type f  -print0| xargs -0 md5sum >> md5_rc1.txt
对于常用的可以直接用于管道的命令，主要有：
cut
grep
sort
uniq
wc
tee
tr
col
join
paste
expand
xargs
```

