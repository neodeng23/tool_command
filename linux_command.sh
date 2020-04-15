#CPU占用
ps auxw|head -1;ps auxw|sort -rn -k3|head -3

#内存占用
ps auxw | head -1;ps auxw|sort -rn -k4|head -10

#查看自己的进程
ps -aux|grep denglf| grep -v grep

#获得文件夹下所有权限
chmod -R 777 file/

#关于ls命令的颜色
$ ls --color=auto
$ ls --color=tty
alias ls='ls --color=auto'    #把ls定义到bash shell，若删除需要去.bashrc文件中删除ls的定义

command & ： 后台运行，你关掉终端会停止运行
nohup command & ： 后台运行，你关掉终端也会继续运行
nohup ./program >/dev/null 2>log &   只输出错误信息到日志文件
nohup ./program >/dev/null 2>&1 &    什么信息也不要
eg:
nohup /usr/local/node/bin/node /www/im/chat.js >> /usr/local/node/output.log 2>&1 &

