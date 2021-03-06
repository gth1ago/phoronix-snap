#!/bin/sh

tar -xf opencv-4.5.4.tar.gz
cd opencv-4.5.4
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j $NUM_CPU_CORES
echo $? > ~/install-exit-status

cd ~

tar -xf opencv_extra-4.5.4.tar.gz

echo "#!/bin/sh
cd opencv-4.5.4/build/bin
export OPENCV_TEST_DATA_PATH=\$HOME/opencv_extra-4.5.4/testdata/
./opencv_perf_\$@ > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > opencv
chmod +x opencv
