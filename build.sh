#!/bin/sh

# change this version string for newer releases
# TODO: make this a simpler config param
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0rc2-cp27-none-linux_x86_64.whl
sudo yum -y update
sudo yum -y upgrade
sudo yum -y group install "Development Tools"
sudo yum -y install Cython --enablerepo=epel
sudo yum -y install python27-devel python27-pip gcc

virtualenv --always-copy ~/tensorflow_env
source ~/tensorflow_env/bin/activate

python2.7 —-version
which python2.7
which pip
pip install --upgrade pip
pip --version
pip install --upgrade ${TF_BINARY_URL}
deactivate

mkdir ~/packages

cd ~/tensorflow_env/lib/python2.7/site-packages
touch google/__init__.py
# TODO: change this hard-coded region name too!
zip -r9v ~/packages/lambda-tensorflow-dependency-ap-southeast-2.zip . --exclude \*.pyc
cd ~/tensorflow_env/lib64/python2.7/site-packages
zip -r9v ~/packages/lambda-tensorflow-dependency-ap-southeast-2.zip . --exclude \*.pyc

cd ~/packages
python -m SimpleHTTPServer 8000