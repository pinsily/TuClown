### 2018.06.07
1. 安装了 LMNP
```
wget -c http://soft.vpser.net/lnmp/lnmp1.5.tar.gz && tar zxf lnmp1.5.tar.gz && cd lnmp1.5 && ./install.sh lnmp
```

2. 修改了用户名
```
vim /etc/hostname
```

3. 安装了 anaconda
```
# 下载
wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.2.0-Linux-x86_64.sh

# 环境变量


```

4. 错误
```
/bin/sh: 1: mysql_config: not found

解决
apt-get install libmysqlclient-dev


```