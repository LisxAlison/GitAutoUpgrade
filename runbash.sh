#!/bin/sh
cd /home/pi/tmp

#判断本地是否存在代码仓库
#有则覆盖，无则克隆
if [ -d "./tmpcode" ]; then
echo "REPOSITORY EXIST, UPDATE..."
/home/pi/tmp/update.exp
else
echo "REPOSITORY NOT EXIST, INIT..."
/home/pi/tmp/smrinit.exp
fi
