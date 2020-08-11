# GitAutoUpgrade
linux cron自动定时拉取git代码覆盖本地

linux部署三个代码文件，实现https方式从AWS CodeCommit下载更新代码仓库；

其中runbash.sh定时执行，调用init.exp和update.exp输入https用户名密码。

# 步骤（自动更新-https方式）：
<b>1.附加用户的IAM policy</b>

主要是对commit的访问策略或ip限制等

<b>2.创建code-commit仓库</b>

除了master分支外，额外创建一个dev分支

<b>3.树莓派安装expect(tcl)</b>

首先查看系统中是否有安装expect

#whereis expect

没有的话安装：

#wget https://sourceforge.net/projects/tcl/files/Tcl/8.4.19/tcl8.4.19-src.tar.gz # tar zxvf tcl8.4.19-src.tar.gz # cd tcl8.4.19/unix && ./configure # make # make install

#wget http://sourceforge.net/projects/expect/files/Expect/5.45/expect5.45.tar.gz # tar zxvf expect5.45.tar.gz # cd expect5.45 # ./configure --with-tcl=/usr/local/lib --with-tclinclude=../tcl8.4.19/generic # make # make install # ln -s /usr/local/bin/expect /usr/bin/expect

其中configure命令中–with-tclinclude选项传入tcl安装包中的generic文件夹路径。

安装完成之后运行expect命令，查看是否安装成功。

<b>4.拷贝自动部署程序文件（runbash.sh,init.exp,update.exp）</b>

<b>5.写定时执行cron</b>

#crontab -e

加入
"* * * * * /youPath/runbash.sh >> /home/pi/runbash.log"

