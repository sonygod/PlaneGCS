cmake_minimum_required(VERSION 3.10)
project(GCS CXX)
set(CMAKE_CXX_STANDARD 17)
include(${CMAKE_CURRENT_SOURCE_DIR}/CommonConfig.cmake)
# 包含FetchContent模块
include(FetchContent)

# 声明Eigen3
FetchContent_Declare(
  eigen
  GIT_REPOSITORY https://gitlab.com/libeigen/eigen.git
  GIT_TAG        3.3.9  # 你可以指定特定的标签或commit
)
# file(GLOB BC_LIB_FILES ${CMAKE_CURRENT_SOURCE_DIR}/lib/*.bc)
# 使得Eigen3内容可用
# 禁用Eigen的测试
set(EIGEN_BUILD_TESTING OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(eigen)

if(NOT TARGET Eigen3::Eigen)
  # 添加Eigen库 (作为一个接口库)
  add_library(Eigen3::Eigen INTERFACE IMPORTED)
  # 设置Eigen头文件的目录
  target_include_directories(Eigen3::Eigen INTERFACE ${eigen_SOURCE_DIR})
endif()
#find_package(Eigen3  REQUIRED NO_MODULE)
# find_package(Boost COMPONENTS graph)

# 设置Boost库的根目录
set(BOOST_ROOT "/home/rock/project/boost_1_84_0")
set(Boost_INCLUDE_DIR "${BOOST_ROOT}")
set(Boost_LIBRARY_DIR "${BOOST_ROOT}/stage/lib")

# 如果你想让CMake优先使用在这个目录中找到的Boost，而不是系统路径中的Boost
set(Boost_NO_SYSTEM_PATHS ON)

# 查找Boost库。假设我们需要filesystem和system组件。
find_package(Boost COMPONENTS graph)

# 确保Boost头文件可以被找到
include_directories(${Boost_INCLUDE_DIRS})


SET(PlaneGCS_SRCS
    src/GCS.cpp
    src/GCS.h
    src/Util.h
    src/Geo.cpp
    src/Geo.h
    src/Constraints.cpp
    src/Constraints.h
    src/SubSystem.cpp
    src/SubSystem.h
    src/qp_eq.cpp
    src/qp_eq.h
)
#SOURCE_GROUP("PlaneGCS" FILES ${PlaneGCS_SRCS})

add_library(PlaneGCS SHARED ${PlaneGCS_SRCS})
target_link_libraries (PlaneGCS Eigen3::Eigen ${Boost_LIBRARIES})
