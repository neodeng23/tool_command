#CPU占用
ps auxw|head -1;ps auxw|sort -rn -k3|head -3

#内存占用
ps auxw | head -1;ps auxw|sort -rn -k4|head -10

#查看自己的进程
ps -aux|grep denglf| grep -v grep

#获得文件夹下所有权限
chmod -R 777 file/

command & ： 后台运行，你关掉终端会停止运行
nohup command & ： 后台运行，你关掉终端也会继续运行
eg:
nohup /usr/local/node/bin/node /www/im/chat.js >> /usr/local/node/output.log 2>&1 &
