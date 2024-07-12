#!/bin/bash

if [ ! -n "$1" ] ;then
echo "编译机型参数未添加！"
exit 0
fi

if [ "$1" != "x86" ]&&[ "$1" != "erx" ] ;then
echo "编译机型参数错误！"
exit 0
fi

# 开始计时
startTime=$(date +%Y%m%d-%H:%M:%S)
startTime_s=$(date +%s)

# 执行
echo "自动化编译 immortalwrt v23.05.2" | tee -a /home/immortalwrt-auto/log.txt
echo "工作目录：/home" | tee -a /home/immortalwrt-auto/log.txt

if [ "$1" == "x86" ] ;then
echo "目标机型：x86" | tee -a /home/immortalwrt-auto/log.txt
fi

if [ "$1" == "erx" ] ;then
echo "目标机型：Ubiquiti EdgeRouter X" | tee -a /home/immortalwrt-auto/log.txt
fi

echo "安装一些编译要用的包..." | tee -a /home/immortalwrt-auto/log.txt
dnf -y install perl wget rsync bzip2 patch tar ncurses-devel

echo "克隆 immortalwrt 源码..." | tee -a /home/immortalwrt-auto/log.txt
cd /home
git clone https://github.com/immortalwrt/immortalwrt.git

echo "设置 immortalwrt 版本 v23.05.2" | tee -a /home/immortalwrt-auto/log.txt
cd /home/immortalwrt
git checkout v23.05.2

echo "更新 immortalwrt 源..." | tee -a /home/immortalwrt-auto/log.txt
./scripts/feeds update -a
echo "安装下载好的包..." | tee -a /home/immortalwrt-auto/log.txt
./scripts/feeds install -a

echo "安装一些第三方包和一些设置..." | tee -a /home/immortalwrt-auto/log.txt

echo "安装主题 Argon..." | tee -a /home/immortalwrt-auto/log.txt
cp -rf /home/immortalwrt-auto/23.05.2/package/luci-theme-argon/ /home/immortalwrt/package/

echo "设置：时区 Asia/Shanghai、NTP 服务器、默认网关..." | tee -a /home/immortalwrt-auto/log.txt
rm -rf /home/immortalwrt/package/base-files/files/bin/config_generate
cp -rf /home/immortalwrt-auto/23.05.2/config/config_generate /home/immortalwrt/package/base-files/files/bin/
chmod 755 /home/immortalwrt/package/base-files/files/bin/config_generate


