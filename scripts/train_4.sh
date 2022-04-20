#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)
models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=8
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data \
        --epochs 40 \
        --log-interval 100 \
        --dropout 0.7 \
        --emsize 250 --nhid 250 --tied \
        --save $models/model_4.pt
)

minutes=$((SECONDS/60))
echo "time taken:"
echo "$minutes minutes"
