#一、安装`crontab`：

`yum -y install vixie-cron`

`yum -y install crontabs`

#二、配置：

cron 是 linux 的内置服务，但它不自动起来，可以用以下的方法启动、关闭这个服务：

service crond start     //启动服务

service crond stop      //关闭服务

service crond restart   //重启服务

service crond reload    //重新载入配置

service crond status    //查看crontab服务状态

在CentOS系统中加入开机自动启动: chkconfig --level 345 crond on

#三、规则：

`*   *　 *　 *　 *　　command`

`分　时　 日　月　周　 命令`

`0-59/1 0-23/1 1-31/1 1-12/1 0-6/1` 数值期间没一个点执行一次

`1 1 1 1 1` 指定的数值期间执行一次



#四、设置：
`crontab -e`　编辑该用户的计时器设置。

`crontab -l`　列出该用户的计时器设置。

`crontab -r`　删除该用户的计时器设置。

`crontab -u<用户名称>` 　指定要设定计时器的用户名称。

#五、例子：
`* 6 * * * /home/wwwroot/backUp/backUp.sh` 在每天的6点执行 某目录下的backUp.sh 脚本文件

`30 21 * * * /usr/local/etc/rc.d/lighttpd restart` 上面的例子表示每晚的21:30重启apache。

`45 4 1,10,22 * * /usr/local/etc/rc.d/lighttpd restart` 上面的例子表示每月1、10、22日的4 : 45重启apache。

`10 1 * * 6,0 /usr/local/etc/rc.d/lighttpd restart` 上面的例子表示每周六、周日的1 : 10重启apache。

`0,30 18-23 * * * /usr/local/etc/rc.d/lighttpd restart` 上面的例子表示在每天18 : 00至23 : 00之间每隔30分钟重启apache。

`0 23 * * 6 /usr/local/etc/rc.d/lighttpd restart` 上面的例子表示每星期六的11 : 00 pm重启apache。

`* */1 * * * /usr/local/etc/rc.d/lighttpd restart` 每一小时重启apache

`* 23-7/1 * * * /usr/local/etc/rc.d/lighttpd restart` 晚上11点到早上7点之间，每隔一小时重启apache

`0 11 4 * mon-wed /usr/local/etc/rc.d/lighttpd restart` 每月的4号与每周一到周三的11点重启apache

`0 4 1 jan * /usr/local/etc/rc.d/lighttpd restart` 一月一号的4点重启apache

`*/30 * * * * /usr/sbin/ntpdate 210.72.145.44` 每半小时同步一下时间
