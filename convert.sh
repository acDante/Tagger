#!/bin/bash
TRAIN_FILE=/scratch/users/duxi/SRL/Tagger/data/conll12-BIO/conll2012.train.txt
NAME=conll12-train*
OUTPUT_DIR=/scratch/users/duxi/SRL/Tagger/data/conll12-pro
DICT_PATH=/scratch/users/duxi/SRL/Tagger/dicts
NUM_SHARDS=10

python tagger/scripts/input_converter.py --input_path $TRAIN_FILE \
                                         --output_name $NAME      \
                                         --output_dir $OUTPUT_DIR \
                                         --vocab $DICT_PATH/vocab.txt $DICT_PATH/label.txt \
                                         --num_shards $NUM_SHARDS \
                                         --shuffle --lower