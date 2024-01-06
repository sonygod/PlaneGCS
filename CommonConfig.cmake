option(DEBUG_MODE "Enable debug mode" ON)
if (EMSCRIPTEN)

    # 设置编译器为 Emscripten
    set(CMAKE_C_COMPILER "emcc")
    set(CMAKE_CXX_COMPILER "em++")
   # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdebug-compilation-dir='.' -g3 -s LLD_REPORT_UNDEFINED=1 -sPROXY_TO_PTHREAD -s ALLOW_BLOCKING_ON_MAIN_THREAD=1 -s NO_DISABLE_EXCEPTION_CATCHING -Wall -w  -s USE_PTHREADS -s USE_OFFSET_CONVERTER  -Wcast-align -Wover-aligned -s WARN_UNALIGNED=1 -s ASSERTIONS=1  --embed-file ./HTML5JavaScriptFx.js ")
 # 调试设置

       if(DEBUG_MODE)
         
         set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdebug-compilation-dir='.' -g3 ")

        else()
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Oz ")
        
        endif()

       

      

        # -w: 禁用所有警告
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -w ")

        # c++ 20

        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20 ")

        # -s USE_PTHREADS: 使用pthread
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s USE_PTHREADS ")

        # -s -pthread

        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s -pthread ")

        # -s USE_BOOST_HEADERS=1

        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s USE_BOOST_HEADERS=1 ")



     

       
else()   
    add_definitions(-DUNICODE -D_UNICODE)
    set(CMAKE_C_COMPILER "/usr/bin/clang")
    set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -mssse3  -Wall -w -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -L /usr/lib/gcc/x86_64-linux-gnu/11")
    #set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -w -stdlib=libc++")
endif()

add_compile_options(-w)
# Print compiler version
execute_process(COMMAND ${CMAKE_C_COMPILER} --version OUTPUT_VARIABLE C_COMPILER_VERSION)
message(STATUS "C Compiler: ${CMAKE_C_COMPILER} version: ${C_COMPILER_VERSION}")

execute_process(COMMAND ${CMAKE_CXX_COMPILER} --version OUTPUT_VARIABLE CXX_COMPILER_VERSION)
message(STATUS "C++ Compiler: ${CMAKE_CXX_COMPILER} version: ${CXX_COMPILER_VERSION}")

# 设置构建类型为 Debug
set(CMAKE_BUILD_TYPE Debug)

# set(CMAKE_BUILD_TYPE Release)