#!/bin/bash
SRLPATH=/scratch/users/duxi/SRL/Tagger/data/srl/srlconll-1.1
TAGGERPATH=/scratch/users/duxi/SRL/Tagger
DATAPATH=/scratch/users/duxi/SRL/Tagger/data/conll12-BIO
DICTPATH=/scratch/users/duxi/SRL/Tagger/dicts

export PERL5LIB="$SRLPATH/lib:$PERL5LIB"
export PATH="$SRLPATH/bin:$PATH"

python $TAGGERPATH/main.py predict --data_path $DATAPATH/conll2012.devel.txt \
  --model_dir train  --model_name deepatt \
  --vocab_path $DICTPATH/vocab.txt $DICTPATH/label.txt \
  --device_list 0 \
  --decoding_params="decode_batch_size=512" \
  --model_params="num_hidden_layers=10,feature_size=100,hidden_size=200,filter_size=800"
python $TAGGERPATH/scripts/convert_to_conll.py conll2012.devel.txt.deepatt.decodes $DATAPATH/conll2012.devel.props.gold.txt output
perl $SRLPATH/bin/srl-eval.pl $DATAPATH/conll2012.devel.props.* output