#!/bin/bash

DEV_DATA=/scratch/users/duxi/SRL/Tagger/data/conll12-BIO/conll2012.devel.txt
DICT_PATH=/scratch/users/duxi/SRL/Tagger/dicts
EMB_PATH=/scratch/users/duxi/SRL/Tagger/data/glove

python main.py predict \
    --data_path $DEV_DATA \
    --model_dir train/best --model_name deepatt \
    --vocab_path $DICT_PATH/vocab.txt $DICT_PATH/label.txt \
    --device_list 0 \
    --decoding_params="decode_batch_size=512" \
    --model_params="num_hidden_layers=10,feature_size=100,hidden_size=200,filter_size=800" \
    --emb_path EMB_PATH/glove.6B.100d.txt