#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: 0xACE7
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.99.1/g' openwrt/package/base-files/files/bin/config_generate

#2. 修改主机名
sed -i '/uci commit system/i\uci set system.@system[0].hostname='Openwrt.Lan'' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. 设置密码为空
#sed -i 's/root::0:0:99999:7:::/root:$1$2.i3iPSw$kFRF8OxpiE1rbF7PlGhd60:0:0:99999:7:::/g' /etc/shadow

#4. 版本号里显示一个自己的名字
sed -i "s/OpenWrt /0xACE7 build $(TZ=UTC-3 date "+%Y.%m.%d") @ OpenWrt /g" openwrt/package/lean/default-settings/files/zzz-default-settings

#5. 修改插件名字
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' openwrt/package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
        
#6. 修改上游DNS
sed -i "2i # network config" openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i "3i uci set network.lan.dns='185.184.222.222'"  openwrt/package/lean/default-settings/files/zzz-default-settings

#7. 修改默认主题为Argon
sed -i 's/default Bootstrap theme/default Argon theme/g' openwrt/feeds/luci/collections/luci/Makefile
sed -i 's/+luci-theme-bootstrap/+luci-theme-argon/g' openwrt/feeds/luci/collections/luci/Makefile
