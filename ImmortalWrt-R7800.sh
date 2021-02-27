#!/bin/bash
#=================================================
# https://github.com/Evi5/ImmortalWrt-Actions-R7800
# Description: R7800 DIY script
# Lisence: Apache License 2.0
# Author: Evi5
# Github: https://github.com/Evi5
#=================================================

# 创建自定义配置文件 - OpenWrt-R7800

rm -f ./.config*
touch ./.config

#
# ========================固件定制部分========================
# 

# 
# ========================固件定制部分结束========================
# 

# 编译者信息
cat >> .config <<EOF
CONFIG_KERNEL_BUILD_USER="Evi5"
CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions @ Evi5"
EOF

# 编译R7800固件:
cat >> .config <<EOF
CONFIG_TARGET_ipq806x=y
CONFIG_TARGET_ipq806x_generic_DEVICE_netgear_r7800=y
EOF

# IPv6支持:
cat >> .config <<EOF
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ipv6helper=y
EOF

# 多文件系统支持:
cat >> .config <<EOF
# CONFIG_PACKAGE_kmod-fs-nfs=y
# CONFIG_PACKAGE_kmod-fs-nfs-common=y
# CONFIG_PACKAGE_kmod-fs-nfs-v3=y
# CONFIG_PACKAGE_kmod-fs-nfs-v4=y
# CONFIG_PACKAGE_kmod-fs-ntfs=y
# CONFIG_PACKAGE_kmod-fs-squashfs=y
CONFIG_PACKAGE_kmod-fs-ext4=y
EOF

# USB3.0支持:
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb-ohci-pci=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-uhci=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-nls-cp437=y
CONFIG_PACKAGE_kmod-nls-iso8859-1=y
CONFIG_PACKAGE_block-mount=y
EOF

# smaba4支持, luci-app-samba内置与smaba4冲突
# cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-samba=n
# CONFIG_PACKAGE_luci-app-samba4=y
# CONFIG_PACKAGE_samba4-server=y
# CONFIG_PACKAGE_luci-i18n-samba4-zh-cn=y
# CONFIG_PACKAGE_samba4-client=y
# EOF

# svn支持
cat >> .config <<EOF
CONFIG_PACKAGE_subversion-server=y
EOF

# SSR-Plus插件:
cat >> .config <<EOF
#xray-core中的v2ray与 vrray冲突
CONFIG_XRAY_CORE_PROVIDE_V2RAY_CORE=n
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y
#CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NaiveProxy is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Redsocks2=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Simple_Obfs=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_Plugin=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=y
EOF

# Passwall插件
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-passwall=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Server is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Server is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_haproxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_dns2socks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y
EOF

# 常用LuCI插件
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-unblockmusic=y #解锁网易云灰色歌曲
CONFIG_UnblockNeteaseMusic_Go=y #解锁网易云灰色歌曲
CONFIG_PACKAGE_luci-app-wrtbwmon=y #实时流量监测
CONFIG_PACKAGE_luci-app-xlnetacc=y #迅雷快鸟
CONFIG_PACKAGE_luci-app-turboacc=y #Turbo ACC 网络加速
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_flow-offload=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_bbr-cca=y
CONFIG_PACKAGE_luci-app-turboacc_INCLUDE_dnsforwarder=y
CONFIG_PACKAGE_luci-app-arpbind=y #IP/MAC绑定
CONFIG_PACKAGE_luci-app-jd-dailybonus=y #京东签到服务
CONFIG_PACKAGE_luci-app-adblock=y #ADB广告过滤
CONFIG_PACKAGE_luci-app-baidupcs-web=y #百度网盘管理
CONFIG_PACKAGE_luci-app-fileassistant=y #文件助手
EOF

# 常用LuCI插件:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-adbyby-plus=y #adbyby去广告
CONFIG_PACKAGE_luci-app-webadmin=y #Web管理页面设置
CONFIG_PACKAGE_luci-app-filetransfer=y #系统-文件传输
CONFIG_PACKAGE_luci-app-qos-gargoyle=y #Gargoyle QoS流控
CONFIG_PACKAGE_luci-app-filebrowser=y #文件浏览器
CONFIG_PACKAGE_luci-app-autoreboot=y #定时重启
CONFIG_PACKAGE_luci-app-frpc=y #Frp内网穿透
CONFIG_PACKAGE_luci-app-frps=y #Frp内网穿透服务器
CONFIG_PACKAGE_luci-app-upnp=y #通用即插即用UPnP(端口自动转发)
# CONFIG_PACKAGE_luci-app-softethervpn is not set #SoftEtherVPN服务器
# CONFIG_PACKAGE_luci-app-softethervpn5 is not set #SoftEtherVPN服务器
CONFIG_PACKAGE_luci-app-sqm=y #SQM智能队列管理
CONFIG_PACKAGE_luci-app-ddns=y #DDNS服务
CONFIG_PACKAGE_luci-app-vsftpd=y #FTP服务器
CONFIG_PACKAGE_luci-app-timewol=y #管控：MAC过滤计划上网重启等
CONFIG_PACKAGE_luci-app-webrestriction=y #访问限制
CONFIG_PACKAGE_luci-app-weburl=y #网址过滤
CONFIG_PACKAGE_luci-app-zerotier=y #ZeroTier内网穿透
CONFIG_PACKAGE_luci-app-accesscontrol=y #访问时间控制
CONFIG_PACKAGE_luci-app-nlbwmon=y #宽带流量监控
CONFIG_PACKAGE_luci-app-guest-wifi=y #WiFi访客网络
CONFIG_PACKAGE_luci-app-netdata=y #Netdata实时监控(图表)
EOF

# 其它LuCI插件
# cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-acme is not set #ACME，申请SSL证书工具
# CONFIG_PACKAGE_luci-app-adguardhome is not set #广告屏蔽
# CONFIG_PACKAGE_luci-app-adguardhome_INCLUDE_binary is not set
# CONFIG_PACKAGE_luci-app-advanced-reboot is not set #Linksys高级重启
# CONFIG_PACKAGE_luci-app-advancedsetting is not set #系统高级设置（Li大内插件）
# CONFIG_PACKAGE_luci-app-ahcp is not set #Ad-Hoc配置协议(AHCP) ipv6 and 双栈 自动配置协议
# CONFIG_PACKAGE_luci-app-airplay2 is not set #Apple AirPlay2 无损音频接收服务器
# CONFIG_PACKAGE_luci-app-airwhu is not set #
# CONFIG_PACKAGE_luci-app-aliddns is not set #阿里DDNS客户端
# CONFIG_PACKAGE_luci-app-amule is not set #aMule下载工具
# CONFIG_PACKAGE_luci-app-appfilter is not set #基于OpenWrt的App过滤(家长控制)模块，支持抖音、斗鱼、王者荣耀、腾讯视频等上百款App过滤
# CONFIG_PACKAGE_luci-app-argon-config is not set #
# CONFIG_PACKAGE_luci-app-aria2 is not set #Aria2下载工具
# CONFIG_PACKAGE_luci-app-asterisk is not set #支持Asterisk电话服务器
# CONFIG_PACKAGE_luci-app-attendedsysupgrade is not set #固件更新升级相关
# CONFIG_PACKAGE_luci-app-autoipsetadder is not set #
# CONFIG_PACKAGE_luci-app-bcp38 is not set #BCP38网络入口过滤
# CONFIG_PACKAGE_luci-app-beardropper is not set #
# CONFIG_PACKAGE_luci-app-bird1-ipv4 is not set #对Bird1-ipv4的支持
# CONFIG_PACKAGE_luci-app-bird1-ipv6 is not set #对Bird1-ipv6的支持
# CONFIG_PACKAGE_luci-app-bmx6 is not set #BMX6路由协议
# CONFIG_PACKAGE_luci-app-brook is not set #Brook代理
# CONFIG_PACKAGE_luci-app-brook-server is not set #Brook代理服务
# CONFIG_PACKAGE_luci-app-cd8021x is not set #
# CONFIG_PACKAGE_luci-app-chinadns is not set #
# CONFIG_PACKAGE_luci-app-cifs is not set #网络共享CIFS/SMB服务器
# CONFIG_PACKAGE_luci-app-cifs-mount is not set #CIFS/SMB挂载设置
# CONFIG_PACKAGE_luci-app-cjdns is not set #加密IPV6网络相关
# CONFIG_PACKAGE_luci-app-clamav is not set #ClamAV杀毒软件
# CONFIG_PACKAGE_luci-app-commands is not set #Shell命令模块
# CONFIG_PACKAGE_luci-app-cpulimit is not set #
# CONFIG_PACKAGE_luci-app-cshark is not set #CloudShark捕获工具
# CONFIG_PACKAGE_luci-app-cupsd is not set #
# CONFIG_PACKAGE_luci-app-dawn is not set #
# CONFIG_PACKAGE_luci-app-diag-core is not set #core诊断工具
# CONFIG_PACKAGE_luci-app-diskman is not set #磁盘管理工具
# CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs is not set
# CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk is not set
# CONFIG_PACKAGE_luci-app-diskman_INCLUDE_mdadm is not set
# CONFIG_PACKAGE_luci-app-diskman_INCLUDE_kmod_md_raid456 is not set
# CONFIG_PACKAGE_luci-app-diskman_INCLUDE_kmod_md_linear is not set
# CONFIG_PACKAGE_luci-app-dnscrypt-proxy is not set #DNSCrypt解决DNS污染
# CONFIG_PACKAGE_luci-app-dnsforwarder is not set #DNSForwarder防DNS污染
# CONFIG_PACKAGE_luci-app-docker is not set #Docker容器
# CONFIG_PACKAGE_luci-app-dockerman is not set #Docker容器
# CONFIG_PACKAGE_luci-app-dump1090 is not set #民航无线频率（不确定）
# CONFIG_PACKAGE_luci-app-dynapoint is not set #
# CONFIG_PACKAGE_luci-app-e2guardian is not set #Web内容过滤器
# CONFIG_PACKAGE_luci-app-eqos is not set #依IP地址限速（Li大内插件
# CONFIG_PACKAGE_luci-app-familycloud is not set #家庭云盘
# CONFIG_PACKAGE_luci-app-freifunk-diagnostics is not set #freifunk组件 诊断（未知）
# CONFIG_PACKAGE_luci-app-freifunk-policyrouting is not set #freifunk组件 策略路由（未知）
# CONFIG_PACKAGE_luci-app-freifunk-widgets is not set #freifunk组件 索引（未知）
# CONFIG_PACKAGE_luci-app-fwknopd is not set #Firewall Knock Operator服务器
# CONFIG_PACKAGE_luci-app-gost is not set #隐蔽的https代理（Li大内插件）
# CONFIG_PACKAGE_luci-app-gowebdav is not set #
# CONFIG_PACKAGE_luci-app-haproxy-tcp is not set #HAProxy负载均衡-TCP
# CONFIG_PACKAGE_luci-app-hd-idle is not set #硬盘休眠
# CONFIG_PACKAGE_luci-app-hnet is not set #Homenet Status家庭网络控制协议
# CONFIG_PACKAGE_luci-app-https-dns-proxy is not set #dns代理
# CONFIG_PACKAGE_luci-app-ipsec-vpnserver-manyusers is not set #
# CONFIG_PACKAGE_luci-app-iptvhelper is not set #
# CONFIG_PACKAGE_luci-app-kcptun is not set #Kcptun加速
# CONFIG_PACKAGE_luci-app-kodexplorer is not set #KOD可道云私人网盘
# CONFIG_PACKAGE_luci-app-ksmbd is not set #
# CONFIG_PACKAGE_luci-app-lxc is not set #LXC容器管理
# CONFIG_PACKAGE_luci-app-mentohust is not set #
# CONFIG_PACKAGE_luci-app-meshwizard is not set #网络设置向导
# CONFIG_PACKAGE_luci-app-minidlna is not set #完全兼容DLNA / UPnP-AV客户端的服务器软件
# CONFIG_PACKAGE_luci-app-minieap is not set #
# CONFIG_PACKAGE_luci-app-mjpg-streamer is not set #兼容Linux-UVC的摄像头程序
# CONFIG_PACKAGE_luci-app-music-remote-center is not set #PCHiFi 数字转盘遥控
# CONFIG_PACKAGE_luci-app-mwan3 is not set #MWAN负载均衡
# CONFIG_PACKAGE_luci-app-mwan3helper is not set #MWAN3分流助手
# CONFIG_PACKAGE_luci-app-mwol is not set #
# CONFIG_PACKAGE_luci-app-n2n_v2 is not set #N2N 内网穿透 N2N v2 virtual**服务
# CONFIG_PACKAGE_luci-app-naiveproxy is not set #NaiveProxy代理
# CONFIG_PACKAGE_luci-app-nfs is not set #NFS网络共享
# CONFIG_PACKAGE_luci-app-nft-qos is not set #QOS流控 Nftables版
# CONFIG_PACKAGE_luci-app-nginx-pingos is not set #
# CONFIG_PACKAGE_luci-app-ngrokc is not set #Ngrok 内网穿透
# CONFIG_PACKAGE_luci-app-njitclient is not set #
# CONFIG_PACKAGE_luci-app-nps is not set #内网穿透nps
# CONFIG_PACKAGE_luci-app-ntpc is not set #NTP时间同步服务器
# CONFIG_PACKAGE_luci-app-ocserv is not set #OpenConnect virtual**服务
# CONFIG_PACKAGE_luci-app-oled is not set #
# CONFIG_PACKAGE_luci-app-olsr is not set #OLSR配置和状态模块
# CONFIG_PACKAGE_luci-app-olsr-services is not set #OLSR服务器
# CONFIG_PACKAGE_luci-app-olsr-viz is not set #OLSR可视化
# CONFIG_PACKAGE_luci-app-onliner is not set #
# CONFIG_PACKAGE_luci-app-openclash is not set #OpenClash代理客户端（Li大内插件）
# CONFIG_PACKAGE_luci-app-openvpn is not set #
# CONFIG_PACKAGE_luci-app-openvpn-server is not set #
# CONFIG_PACKAGE_luci-app-oscam is not set #OSCAM服务器
# CONFIG_PACKAGE_luci-app-p910nd is not set #打印服务器模块
# CONFIG_PACKAGE_luci-app-pagekitec is not set #Pagekite 内网穿透客户端
# CONFIG_PACKAGE_luci-app-polipo is not set #Polipo代理（是一个小型且快速的网页缓存代理）
# CONFIG_PACKAGE_luci-app-pppoe-relay is not set #PPPoE NAT穿透 点对点协议（PPP）
# CONFIG_PACKAGE_luci-app-pppoe-server is not set #PPPoE NAT穿透 点对点协议（PPP）服务端
# CONFIG_PACKAGE_luci-app-privoxy is not set #Privoxy网络代理（带过滤无缓存）
# CONFIG_PACKAGE_luci-app-ps3netsrv is not set #PS3 NET服务器（用于加载蓝光/游戏ISO/PKG）
# CONFIG_PACKAGE_luci-app-qbittorrent is not set #BT下载工具（qBittorrent）
# CONFIG_PACKAGE_luci-app-qos is not set #流量服务质量(QoS)流控
# CONFIG_PACKAGE_luci-app-qosv4 is not set #
# CONFIG_PACKAGE_luci-app-radicale is not set #CalDAV/CardDAV同步工具
# CONFIG_PACKAGE_luci-app-rclone is not set #命令行云端同步工具
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-webui is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_rclone-ng is not set
# CONFIG_PACKAGE_luci-app-rclone_INCLUDE_fuse-utils is not set
# CONFIG_PACKAGE_luci-app-rp-pppoe-server is not set #Roaring Penguin PPPoE Server 服务器
# CONFIG_PACKAGE_luci-app-scutclient is not set #
# CONFIG_PACKAGE_luci-app-serverchan is not set #
# CONFIG_PACKAGE_luci-app-shadowsocks-libev is not set #
# CONFIG_PACKAGE_luci-app-shairplay is not set #支持AirPlay功能
# CONFIG_PACKAGE_luci-app-siitwizard is not set #SIIT配置向导 SIIT-Wizzard
# CONFIG_PACKAGE_luci-app-simple-adblock is not set #简单的广告拦截
# CONFIG_PACKAGE_luci-app-smartdns is not set #本地dns
# CONFIG_PACKAGE_luci-app-smartinfo is not set #
# CONFIG_PACKAGE_luci-app-smstool is not set #
# CONFIG_PACKAGE_luci-app-socat is not set #
# CONFIG_PACKAGE_luci-app-speederv2 is not set #
# CONFIG_PACKAGE_luci-app-splash is not set #Client-Splash是无线MESH网络的一个热点认证系统
# CONFIG_PACKAGE_luci-app-squid is not set #Squid代理服务器
# CONFIG_PACKAGE_luci-app-ssocks is not set #
# CONFIG_PACKAGE_luci-app-ssr-libev-server is not set #
# CONFIG_PACKAGE_luci-app-ssr-mudb-server is not set #
# CONFIG_PACKAGE_luci-app-ssrserver-python is not set #
# CONFIG_PACKAGE_luci-app-statistics is not set #流量监控工具
# CONFIG_PACKAGE_luci-app-syncdial is not set #多拨虚拟WAN(原macvlan)
# CONFIG_PACKAGE_luci-app-syncthing is not set #同步工具
# CONFIG_PACKAGE_luci-app-sysuh3c is not set #
# CONFIG_PACKAGE_luci-app-terminal is not set #
# CONFIG_PACKAGE_luci-app-timecontrol is not set #
# CONFIG_PACKAGE_luci-app-tinyproxy is not set #Tinyproxy是 HTTP(S)代理服务器
# CONFIG_PACKAGE_luci-app-transmission is not set #BT下载工具
# CONFIG_PACKAGE_luci-app-travelmate is not set #旅行路由器
# CONFIG_PACKAGE_luci-app-trojan-server is not set #Trojan服务端
# CONFIG_PACKAGE_luci-app-ttyd is not set #网页终端命令行
# CONFIG_PACKAGE_luci-app-udp2raw is not set #
# CONFIG_PACKAGE_luci-app-udpxy is not set #udpxy做组播服务器
# CONFIG_PACKAGE_luci-app-uhttpd is not set #uHTTPd Web服务器
# CONFIG_PACKAGE_luci-app-unblockneteasemusic is not set #解锁网易云
# CONFIG_PACKAGE_luci-app-unblockneteasemusic-go is not set #解除网易云音乐
# CONFIG_PACKAGE_luci-app-unblockneteasemusic-mini is not set #解除网易云音乐
# CONFIG_PACKAGE_luci-app-unbound is not set #Unbound DNS解析器
# CONFIG_PACKAGE_luci-app-usb-printer is not set #USB 打印服务器
# CONFIG_PACKAGE_luci-app-usb3disable is not set #
# CONFIG_PACKAGE_luci-app-uugamebooster is not set #UU网游加速器
# CONFIG_PACKAGE_luci-app-v2ray-server is not set #
# CONFIG_PACKAGE_luci-app-verysync is not set #微力同步
# CONFIG_PACKAGE_luci-app-vlmcsd=y #KMS激活服务器
# CONFIG_PACKAGE_luci-app-vnstat is not set #vnStat网络监控（图表）
# CONFIG_PACKAGE_luci-app-vpn-policy-routing is not set #
# CONFIG_PACKAGE_luci-app-vpnbypass is not set #
# CONFIG_PACKAGE_luci-app-vssr is not set #
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_V2ray_plugin is not set
# CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray is not set
# CONFIG_PACKAGE_luci-app-watchcat is not set #断网检测功能与定时重启
# CONFIG_PACKAGE_luci-app-webrestriction is not set #
# CONFIG_PACKAGE_luci-app-weburl is not set #MAC过滤计划上网重启等
# CONFIG_PACKAGE_luci-app-wifischedule is not set #WiFi 计划
# CONFIG_PACKAGE_luci-app-wireguard is not set #virtual**服务器 WireGuard状态
# CONFIG_PACKAGE_luci-app-wol=y #网络唤醒

# EOF

# LuCI主题:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-Butterfly=y
CONFIG_PACKAGE_luci-theme-Butterfly-dark=y
# CONFIG_PACKAGE_luci-theme-argon=y
# CONFIG_PACKAGE_luci-theme-argon-dark-mod=y
# CONFIG_PACKAGE_luci-theme-argon-light-mod=y
# CONFIG_PACKAGE_luci-theme-argon-mc=y
# CONFIG_PACKAGE_luci-theme-argon-mod=y
# CONFIG_PACKAGE_luci-theme-argonv2=y
CONFIG_PACKAGE_luci-theme-argonv3=y
CONFIG_PACKAGE_luci-theme-atmaterial=y
CONFIG_PACKAGE_luci-theme-bootstrap=y
CONFIG_PACKAGE_luci-theme-bootstrap-mod=y
CONFIG_PACKAGE_luci-theme-darkmatter=y
CONFIG_PACKAGE_luci-theme-edge=y
CONFIG_PACKAGE_luci-theme-infinityfreedom=y
CONFIG_PACKAGE_luci-theme-material=y
# CONFIG_PACKAGE_luci-theme-netgear=y
CONFIG_PACKAGE_luci-theme-netgearv2=y
CONFIG_PACKAGE_luci-theme-opentomato=y
CONFIG_PACKAGE_luci-theme-opentomcat=y
CONFIG_PACKAGE_luci-theme-rosy=y
EOF

sed -i 's/^[ \t]*//g' ./.config

# 配置文件创建完成
