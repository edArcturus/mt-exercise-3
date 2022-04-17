#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

# mkdir -p $data/wikitext-2

# for corpus in train valid test; do
#     absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
#     ln -snf $absolute_path $data/wikitext-2/$corpus.txt
# done

# download a different interesting data set!

# mkdir -p $data/grimm

# mkdir -p $data/grimm/raw

# wget https://www.gutenberg.org/files/52521/52521-0.txt
# mv 52521-0.txt $data/grimm/raw/tales.txt

# preprocess slightly

python3 $scripts/convert_8859-1_utf-8.py $data/raw/bond.txt > $data/raw/bond_utf-8.txt

cat $data/raw/bond_utf-8.txt | python $base/scripts/preprocess_raw.py > $data/raw/bond.cleaned.txt


# tokenize, fix vocabulary upper bound

cat $data/raw/bond.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
    $data/raw/bond.preprocessed.txt



# split into train, valid and test


# head -n 440 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/valid.txt
# head -n 840 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/test.txt
# tail -n 3075 $data/grimm/raw/tales.preprocessed.txt | head -n 2955 > $data/grimm/train.txt


head -n 2029 $data/raw/bond.preprocessed.txt | tail -n 1979 > $data/valid.txt
head -n 4058 $data/raw/bond.preprocessed.txt | tail -n 1979 > $data/test.txt
tail -n 16233 $data/raw/bond.preprocessed.txt | head -n 16153 > $data/train.txt
