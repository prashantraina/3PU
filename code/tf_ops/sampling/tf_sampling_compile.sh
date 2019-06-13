#/bin/bash
CUDA_HOME=/opt/cuda
TF_CFLAGS=$(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))')
TF_LFLAGS=$(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))')
nvcc tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
g++ -std=c++11 -c tf_sampling.cpp -o tf_sampling.o -fPIC -I$CUDA_HOME/include $TF_CFLAGS $TF_LFLAGS -O2
nvcc -std=c++11 tf_sampling.o tf_sampling_g.cu.o -o tf_sampling_so.so -shared -I$CUDA_HOME/include $TF_CFLAGS $TF_LFLAGS -O2
