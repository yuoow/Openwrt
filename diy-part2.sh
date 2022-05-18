#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# 更改默认IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 清除默认密码/改密码为 
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' feeds/luci/collections/luci/Makefile

# 修改机器名称
sed -i 's/OpenWrt/YuMoon/g' package/base-files/files/bin/config_generate

# 修改wifi名称
sed -i 's/OpenWrt/YuMoon/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改banner
# rm -rf package/base-files/files/etc/banner
# cp -f ../banner package/base-files/files/etc/

# 修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# 修改banner
cat > package/base-files/files/etc/banner <<EOF
_____.___.        _____                        
\__  |   |__ __  /     \   ____   ____   ____  
 /   |   |  |  \/  \ /  \ /  _ \ /  _ \ /    \ 
 \____   |  |  /    Y    (  <_> |  <_> )   |  \
 / ______|____/\____|__  /\____/ \____/|___|  /
 \/    W I R E L E S S   \/  F R E E D O M  \/                            
 -----------------------------------------------------
 CHAOS CALMER (%C, %R) Ver:0.1-2022-05-18 by YuMoon
 -----------------------------------------------------
EOF
cp $GITHUB_WORKSPACE/banner package/base-files/files/etc/banner
