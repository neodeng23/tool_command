#CPU占用
ps auxw|head -1;ps auxw|sort -rn -k3|head -3

#内存占用
ps auxw | head -1;ps auxw|sort -rn -k4|head -10

#查看自己的进程
ps -aux|grep denglf| grep -v grep

command & ： 后台运行，你关掉终端会停止运行
nohup command & ： 后台运行，你关掉终端也会继续运行