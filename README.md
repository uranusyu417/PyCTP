# PyCTP
本项目用于基于CTP接口的期货交易，目前测试环境为Python3.x。之前也在Python 2.7环境中测试使用过。

使用swig封装了Windows 64bit CTP控件的C++接口，可在Python中直接调用。

对于接口中部分通过C++参数回传运行结果的情况，也进行了封装，Python中调用会返回到函数的返回结果tuple中。

使用方法为根目录中运行：

`python setup build`编译生成python所需的运行文件

运行本项目，Python2.7需安装visual c++ for python2.7编译环境，Python3.x需安装vc++15，可下载安装Visual Studio 2017。

之前为私人项目，目前用在自己的量化交易程序中，现在公开方便其他人封装使用，避免重复工作。

欢迎使用交流，共同完善接口。
