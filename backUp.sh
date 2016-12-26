#!/bin/bash
#AMH 备份所有的数据库和指定的网站程序(请注意：上传到linux中记得设置.sh文件的格式和去除乱码并授权)
cd /home/wwwroot/backUp/
dbPwd='wWuz7E5HGyMFY93'
#创建本次备份的日期路径
todayDir=`date -d "today" +"%Y-%m-%d"`
#删除旧文件
if [ -d "$todayDir" ]; then rm -rf $todayDir; fi
mkdir $todayDir
sqlDir=$todayDir'/sql'
websiteDir=$todayDir'/website'
mkdir $sqlDir
mkdir $websiteDir

#备份所有的数据库
for database in `mysql -uroot -pwWuz7E5HGyMFY93 -e "show databases;"|sed '1,2d'|egrep -v 'mysql|test'`
do
mysqldump -uroot -p${dbPwd} ${database} |gzip > ${sqlDir}/${database}.sql.gz
done

#mysqldump -uroot -pwWuz7E5HGyMFY93 --all-databases | gzip > database_`date '+%m-%d-%Y'`.sql.gz

#备份功能
websiteName=(dadedadeads.com order.bagssell.co usa.bagssell.net yuting.bagssell.net ok.bagssell.net fb-account.com)
for website in ${websiteName[@]}
do
zip -rq ${websiteDir}/${website}.zip ../${website}/web/*
done

#压缩备份
zip -rq ${todayDir}.zip ${todayDir}
#删除备份文件夹
rm -rf ${todayDir}

#删除昨天的备份
yesterdayZip=`date -d "yesterday" +"%Y-%m-%d"`'.zip'
if [ -f "$yesterdayZip" ]; then rm -rf $yesterdayZip; fi
