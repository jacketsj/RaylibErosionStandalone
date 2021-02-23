mkdir build
cd build
cmake -D CMAKE_CXX_COMPILER=/usr/bin/g++ ..
make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED
#make
