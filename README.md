# MT Exercise 3: Pytorch RNN Language Models: generate Bond-like text

This repo uses the first four Bond novels by Ian Fleming to train an RNN language model using 
[Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).


# Requirements

- This only works on a Unix-like system, with bash. (Mac users may have to `brew install coreutils`)
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    TODO: git clone https://github.com/emmavdbold/mt-exercise-3
    cd mt-exercise-3

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_bond_data.sh

Train a model:

- Run any of the scripts `train_1.sh` to `train_5.sh` in the scripts folder to train the model with different 
dropout rates, e.g.:

    ./scripts/train_1.sh

|Model|Dropout rate|
|-|-|
|1|0|
|2|0.3|
|3|0.5|
|4|0.7|
|5|0.85|



The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh model_number

With `model_number` being a number referring to the model number, e.g.:

    .scripts/generate.sh 3

250 words of generated text will be saved to `sample_n.txt` in the `samples` folder.


