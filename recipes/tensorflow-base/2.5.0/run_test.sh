#!/bin/bash

cat << EOF > gpu_test.py
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
a = tf.constant(10)
b = tf.constant(32)
a + b
EOF

python gpu_test.py
