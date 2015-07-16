#!/usr/bin/env bash
# Install various base systems on ubuntu
# in Bash form until I decide to learn Ansible


bare_minimums () {
    # Basic machine installation, installs bare minimum packages
    # Init sudo
    sudo -v

    # Update packages
    sudo apt-get update -y
    sudo apt-get upgrade -y

    # Install bare essentials
    sudo apt-get install -y openssh-server default-jre 

    # Install git
    sudo apt-get install -y vim git-core
    git config --global user.name "Nate Harada"
    git config --global user.email "nharada1@gmail.com"

    # Install vim
    sudo apt-get install -y vim
}

build_machine () {
    # Build tools
    sudo apt-get install -y build-essential libboost-all-dev
}

python() {
    # Requirements
    sudo apt-get install -y libfreetype6 libfreetype6-dev libpng-dev python-dev pkg-config
    # Python2 packages
    sudo apt-get install -y python-numpy python-scipy python-nose python-matplotlib python-pip
}

mri-client() {
    # Download Mri-python-client
    git clone https://github.com/Mri-monitoring/Mri-python-client.git 
    cd Mri-python-client
    sudo pip install -r requirements.txt
    sudo python setup.py install
    cd -
    # Download Mri-app
    git clone https://github.com/Mri-monitoring/Mri-app.git
    cd Mri-app
    sudo pip install -r requirements.txt
    sudo python setup.py install
    cd -
    mkdir Files
}

caffe() {
    # Install the deps
    sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev
    sudo apt-get install -y libatlas-base-dev
    sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler
    # Download and install Caffe
    git clone https://github.com/BVLC/caffe.git
    cd caffe
    cp Makefile.config.example Makefile.config
    sed -i 's/# CPU_ONLY := 1/CPU_ONLY := 1/' Makefile.config
    make all
    make test
    make runtest
    cd -
    # Install the MNIST dataset for testing
    cd caffe
    ./data/mnist/get_mnist.sh
    ./examples/mnist/create_mnist.sh
    cd -
}


# Run install, extras based on command line arguments
bare_minimums
build_machine
python
mri-client
caffe
for var in "$@"
do
    $var
done
