编译说明
1.下载  boost_1_84_0包 wget https://archives.boost.io/release/1.84.0/source/boost_1_84_0.tar.gz

2.解压  tar zxvf boost_1_84_0.tar.gz

3. ./bootstrap.sh  --with-libraries=graph  这里可能也可以是all?
 
5. ./b2 toolset=emscripten  link=static

7. mkdir build

9. cd buld
 
11. emcmake cmake ..

   
