编译说明
1.下载  boost_1_84_0包 wget https://archives.boost.io/release/1.84.0/source/boost_1_84_0.tar.gz

2.解压  tar zxvf boost_1_84_0.tar.gz

3. ./bootstrap.sh  --with-libraries=graph  这里可能也可以是all?
 
4. ./b2 toolset=emscripten  link=static

5. mkdir build

6. cd buld
 
7. emcmake cmake .. -DBOOST_ROOT=/home/rock/project/boost_1_84_0

8 .make -j4

其中。
   
uses: lovasoa/setup-emscripten@master
with:
  emscripten-version: '3.1.52'