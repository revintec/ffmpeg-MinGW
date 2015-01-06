#!/bin/bash

cd x264-snapshot-20141218-2245
make uninstall
make clean
echo cleanup done. configuring...
./configure --enable-static
make install
cd ..
echo ================================
cd fdk-aac-0.1.3
make uninstall
make clean
echo cleanup done. configuring...
./configure
make install
cp /usr/local/bin/libfdk-aac-0.dll ../libfdk-aac-0.dll
cd ..
echo ================================
cd ffmpeg-2.5.2
make uninstall
make clean
echo cleanup done. configuring...
./configure --enable-gpl --enable-nonfree --extra-cflags="-I/usr/local/include -D_cdecl=__cdecl" --extra-cxxflags="-I/usr/local/include" --extra-ldflags="-L/usr/local/lib" --enable-libfdk-aac --enable-libx264
make
cp ffmpeg.exe ../ffmpeg.exe
cd ..
echo ================================
echo copy libiconv-2.dll from MinGW/bin yourself
