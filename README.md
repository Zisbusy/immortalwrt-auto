# immortalwrt-auto
immortalwrt 自动化编译脚本

## 脚本环境     
基于 Rocky Linux 编写，使用 Root 账号进行编译。      
高度理想化，无任何错误判断，需自行观察是否有错误日志。      
需要自备代理软件，并修改脚本内 192.168.10.10 的地址（中国大陆地区以外的网络环境可以直接取消代理）

## 如何使用
### 一键脚本
```
# Ubiquiti EdgeRouter X
curl -sSL https://raw.githubusercontent.com/Zisbusy/immortalwrt-auto/main/start.sh -o start.sh && sudo bash start.sh erx
# x86 设备
curl -sSL https://raw.githubusercontent.com/Zisbusy/immortalwrt-auto/main/start.sh -o start.sh && sudo bash start.sh x86
```

### 加速地址
```
# Ubiquiti EdgeRouter X
curl -sSL https://mirror.ghproxy.com/https://raw.githubusercontent.com/Zisbusy/immortalwrt-auto/main/start.sh -o start.sh && sudo bash start.sh erx
# x86 设备
curl -sSL https://mirror.ghproxy.com/https://raw.githubusercontent.com/Zisbusy/immortalwrt-auto/main/start.sh -o start.sh && sudo bash start.sh x86
```
## 说明  
本固件高度自定义，贴近个人使用场景。      
 - 基础上网功能（默认 immortalwrt 配置）       
 - 默认支持 ipv6
 - 添加 UPNP
 - 取消 dnsmasq 使用 dnsmasqfull
 - 添加主题 Argon（更改、并修复一些样式问题）
 - 调整分区大小 32m、160m
 - 支持 ext4 分区（x86）
 - 调整 eth0 默认 WAN 口（x86）
 - 调整时区为 Asia/Shanghai
 - 更改 ntp 服务地址
 - 更改默认网关 192.168.10.1


## 使用的项目

OpenWrt **https://github.com/openwrt/openwrt**      
Argon **https://github.com/jerrykuku/luci-theme-argon**      
