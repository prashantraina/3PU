nvcc = /opt/cuda/bin/nvcc
#cudalib = /opt/cuda/lib64/
TF_CFLAGS:=$(shell python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))')
TF_LFLAGS:=$(shell python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))')
#tensorflow = $(HOME)/anaconda3/envs/tf/lib/python3.5/site-packages/tensorflow/include
#tf_lib = $(HOME)/anaconda3/envs/tf/lib/python3.5/site-packages/tensorflow

#TensorFlow should have been compiled with -D_GLIBCXX_USE_CXX11_ABI=0

all: tf_nndistance_so.so
.PHONY : all

#tf_nndistance_so.so: tf_nndistance_g.cu.o tf_nndistance.cpp
#	g++-7 -std=c++11 tf_nndistance.cpp tf_nndistance_g.cu.o -o tf_nndistance_so.so -Lcuda -Lcudart -shared -fPIC -O2 $(TF_CFLAGS) $(TF_LFLAGS)

tf_nndistance_so.so: tf_nndistance_g.cu.o tf_nndistance.o
	$(nvcc)  -std=c++11 tf_nndistance.o tf_nndistance_g.cu.o -o tf_nndistance_so.so -shared -O2 $(TF_CFLAGS) $(TF_LFLAGS)

tf_nndistance.o: 
	g++ -std=c++11 -c tf_nndistance.cpp -o tf_nndistance.o -fPIC -O2 $(TF_CFLAGS) $(TF_LFLAGS)


tf_nndistance_g.cu.o: 
	$(nvcc) -std=c++11 -c -o tf_nndistance_g.cu.o tf_nndistance_g.cu $(TF_CFLAGS) $(TF_LFLAGS) -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC -O2

# render_balls_so.so: render_balls_so.cpp
# 	g++ -std=c++11 render_balls_so.cpp -o render_balls_so.so -shared -fPIC -O2 -D_GLIBCXX_USE_CXX11_ABI=0


