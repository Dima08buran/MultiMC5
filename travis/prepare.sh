set -e

if [ "$TRAVIS_OS_NAME" = "linux" ]
then
	QT_WITHOUT_DOTS=qt$(echo $QT_VERSION | grep -oP "[^\.]*" | tr -d '\n' | tr '[:upper:]' '[:lower]')
	QT_PKG_PREFIX=$(echo $QT_WITHOUT_DOTS | cut -c1-4)
	echo $QT_WITHOUT_DOTS
	echo $QT_PKG_PREFIX
	sudo add-apt-repository -y ppa:beineri/opt-${QT_WITHOUT_DOTS}
	sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test # for a recent GCC
	sudo apt-get update -qq
	sudo apt-get install ${QT_PKG_PREFIX}base ${QT_PKG_PREFIX}svg ${QT_PKG_PREFIX}tools ${QT_PKG_PREFIX}x11extras ${QT_PKG_PREFIX}webkit

	wget http://www.cmake.org/files/v3.2/cmake-3.2.2-Linux-x86_64.sh
	sudo sh cmake-3.2.2-Linux-x86_64.sh --skip-license --prefix=/

	export CMAKE_PREFIX_PATH=/opt/$QT_PKG_PREFIX/lib/cmake
	export PATH=/opt/$QT_PKG_PREFIX/bin:$PATH
else
	brew update
	brew install qt5
	brew install cmake
	export CMAKE_PREFIX_PATH=/usr/local/lib/cmake
fi
