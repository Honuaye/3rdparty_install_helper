sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential checkinstall cmake pkg-config yasm
echo -e "\n"
sudo apt-get install git gfortran
echo -e "\n"
#sudo apt-get install libjpeg8-dev libjasper-dev libpng12-dev
sudo apt-get install libtiff5-dev
echo -e "\n"
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
echo -e "\n"
sudo apt-get install libxine2-dev libv4l-dev
echo -e "\n"
#sudo apt-get install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
echo -e "\n"
sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev
echo -e "\n"
sudo apt-get install libatlas-base-dev
echo -e "\n"
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev
echo -e "\n"
sudo apt-get install libvorbis-dev libxvidcore-dev
echo -e "\n"
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev
echo -e "\n"
sudo apt-get install x264 v4l-utils
echo -e "\n"



sudo apt-get install libjpeg8-dev libpng-dev
echo -e "\n"
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
echo -e "\n"
sudo apt  update
echo -e "\n"
sudo apt-get install libjasper-dev
echo -e "\n"

# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler
echo -e "\n"
sudo apt-get install libgoogle-glog-dev libgflags-dev
echo -e "\n"
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
echo -e "\n"


##download opencv from  github.com
#cd PATH-TO-OPENCV
#mkdir build
#cd build
#cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

	#if build with opencv_contrib  (you can change the install path specially)
	#cmake -D CMAKE_BUILD_TYPE=RELEASE  -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules  -D CMAKE_INSTALL_PREFIX=/usr/local ..

#make  -j8
#sudo make install
#sudo ldconfig

#check version
#pkg-config --modversion opencv
#pkg-config --cflags opencv
#pkg-config --libs opencv


