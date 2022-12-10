
# add repository
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'

# add key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654

sudo apt-get update
echo -e "\n"
sudo apt-get install ros-melodic-desktop-full
echo -e "\n"
echo -e "finish install ros-melodic-desktop-full\n"
echo -e "\n"
sudo apt-get install ros-melodic-rqt*
echo -e "\n"


sudo apt install rospack-tools
# init rosdep
sudo rosdep init
rosdep update

# if update lost: 
#打开hosts文件
#sudo gedit /etc/hosts
#在文件末尾添加
#151.101.84.133  raw.githubusercontent.com
#保存后退出再尝试
#rosdep update

#现况是： 如果不翻墙，那么 sudo rosdep init 和 rosdep update 铁定是报错的
#解决方法参考链接： https://blog.csdn.net/senlijiu/article/details/124203913
#问题一： sudo rosdep init 实际上是生成了一个文件： /etc/ros/rosdep/sources.list.d/20-default.list
cd  /etc/ros/rosdep/sources.list.d  &&  sudo mkdir   20-default.list
sudo vim 20-default.list
#往里面添加内容：
## os-specific listings first
	#yaml https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/osx-homebrew.yaml osx
## generic
	#yaml https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/base.yaml
	#yaml https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/python.yaml
	#yaml https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/ruby.yaml
	#gbpdistro https://raw.githubusercontent.com/ros/rosdistro/master/releases/fuerte.yaml fuerte
#那么就完成了， sudo rosdep init 的步骤
#问题二： rosdep update 失败，原因还是不能科学上网， 这一步骤 本质是完成下载上一步添加的文件内的下载内容
#解决方法：
#首先下载好所有需要的文件（已经放在github了）
git clone https://github.com/ros/rosdistro.git
#记住上面文件下载好的位置就行， 会下载一个文件夹 rosdistro
#需要手动修改三个地方：
#修改文件1：
sudo vim  /usr/lib/python3/dist-packages/rosdep2/rep3.py
#如果发现没有文件（打开是空的），那么需要执行下面命令：
sudo apt-get install python-rosdep
sudo apt-get install python3-rosdep
#执行完后，就有文件内容了，修改具体内容如下:
	# REP3_TARGETS_URL = 'https://raw.githubusercontent.com/ros/rosdistro/master/releases/targets.yaml'
	REP3_TARGETS_URL = 'file://PATH_TO/rosdistro/releases/targets.yaml'
	#例如我的：  REP3_TARGETS_URL = 'file:///home/yhh/ws/3rdparty/rosdistro/releases/targets.yaml'
#修改文件2：
sudo vim /usr/lib/python3/dist-packages/rosdistro/__init__.py
#修改内容如下：
	# DEFAULT_INDEX_URL = 'https://raw.githubusercontent.com/ros/rosdistro/master/index-v4.yaml'
	DEFAULT_INDEX_URL = 'file://PATH_TO/rosdistro/index-v4.yaml'
	# example : DEFAULT_INDEX_URL = 'file:///home/yhh/ws/3rdparty/rosdistro/index-v4.yaml'
#修改最后文件3（实际上就是上一步做好的文件）
	yaml file:///home/yhh/ws/3rdparty/rosdistro/rosdep/osx-homebrew.yaml osx
	# generic
	yaml file:///home/yhh/ws/3rdparty/rosdistro/rosdep/base.yaml
	yaml file:///home/yhh/ws/3rdparty/rosdistro/rosdep/python.yaml
	yaml file:///home/yhh/ws/3rdparty/rosdistro/rosdep/ruby.yaml
	gbpdistro file:///home/yhh/ws/3rdparty/rosdistro/releases/fuerte.yaml fuerte
#同样的，需要注意修改成自己的rosdistro路径；
#至此，完成所有修改，终端执行:
rosdep update
# 没报错就OK


# modified bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# install others tools
sudo apt update
echo -e "\n"
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

