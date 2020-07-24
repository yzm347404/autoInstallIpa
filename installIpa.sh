#!/bin/sh
#需要先安装ideviceinstaller命令
#脚本使用方法 sh 脚本文件   ipa路径
deviceList=`instruments -s devices`
top='['
for i in ${deviceList}; do
	if [[ $i == *$top* ]]; then
		uuid=`echo $i|cut -d "[" -f2|cut -d ""]"" -f1`
		echo $uuid
		ideviceinstaller -i $1 -u $uuid
	fi
done