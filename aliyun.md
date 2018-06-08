<<<<<<< HEAD
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

=======
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


uwsgi: error while loading shared libraries: libpcre.so.1: cannot open shared object file: No such file or directory

解决
# find / -name libpcre.so.1
/opt/anaconda3/lib/libpcre.so.1

# ldconfig /opt/anaconda3/lib/
>>>>>>> dfa1be1e8bf6ee4f8a52e2b475c89765527bcad1
```