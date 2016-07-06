参考安装的博客网站：http://www.laozuo.org/6542.html

上诉网站中有一些模块没有在一开始就加入编译。如果需要其他的模版，则需要在一开始的时候就加入编译。或者在后续进行独立的编译。

eg.
`
--with-pdo-mysql=/usr/local/mysql
--with-mysqli=/usr/local/mysql/bin/mysql_config
`

已经安装好，单独编译：

###进入该版本PHP扩展库中，检查是否需要编译的模块存在。存在则直接使用。不存在怎么下载
`cd /usr/local/src/php-5.6.9/ext/pdo_mysql`  (进入PHP安装文件夹扩展模块文件夹)

###phpize 命令是用来准备 PHP 外挂模块的编译环境的
`/usr/local/php/bin/phpize`

#假设你的mysql是安装在/usr/local/mysql
`
./configure --with-php-config=/usr/local/php/bin/php-config --with-pdo-mysql=/usr/local/mysql
./configure --with-php-config=/usr/local/php/bin/php-config --with-mysqli=/usr/local/mysql/bin/mysql_config
`

`make && makeinstall`

注意：make 下方出现的.so文件路径才是正确的模块文件路径
###修改php.ini
`extension=/usr/local/php-5.6.9/ext/pdo_mysql/modules/pdo_mysql.so`
`extension=/usr/local/php-5.6.9/ext/mysqli/modules/mysqli.so`
###重启面板
`/etc/init.d/amh-start`
###重启nginx
`amh nginx restart`
