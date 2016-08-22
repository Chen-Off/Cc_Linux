#AMH面板设置SQL远程访问

###修改（添加）防火墙规则：<br/>
`vi /etc/sysconfig/iptables`<br/>
添加 `RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT`<br/>
`service iptables restart`


###设置远程访问帐号授权:<br/>
登陆sql控制台<br/>
`grant select on *.* to 用户名@'%' ;`<br/>
`grant all privileges on *.* to 用户名@'%';`
