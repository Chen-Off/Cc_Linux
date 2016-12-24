#!/bin/bash

cd /home/wwwroot/backUp/
dbPwd='XXXXXXXXXXXXXXX'
websiteDir='allData/'
#删除旧文件
if [ -d "$websiteDir" ]; then rm -rf $websiteDir; fi
mkdir $websiteDir
sqlDir=$websiteDir'sql'
websiteDir=$websiteDir'website'
mkdir $sqlDir
mkdir $websiteDir

#备份所有的数据库
for database in `mysql -uroot -p${dbPwd} -e "show databases;"|sed '1,2d'|egrep -v 'mysql|test'`
do
mysqldump -uroot -p${dbPwd} ${database} |gzip > ${sqlDir}/${database}.sql.gz
done

#备份所有的网站
for website in `ls ../`
do
if [ $website = 'index' ] || [ $website = 'backUp' ]; then 
echo 'error'
else
zip -r ${websiteDir}/${website}.zip ../${website}/web/*
fi
done
