#/bin/bash
CUDA_HOME=/opt/cuda
TF_CFLAGS=$(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))')
TF_LFLAGS=$(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))')
nvcc tf_grouping_g.cu -o tf_grouping_g.cu.o -c $TF_CFLAGS -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
g++ -std=c++11 tf_grouping.cpp tf_grouping_g.cu.o -o tf_grouping_so.so -shared -fPIC -I$CUDA_HOME/include $TF_CFLAGS $TF_LFLAGS -O2 -D_GLIBCXX_USE_CXX11_ABI=0
